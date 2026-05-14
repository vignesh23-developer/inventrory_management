// lib/app/controllers/admin/billing_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customer_bills.dart';
import '../models/inventory_data.dart';
import '../models/models.dart';

class BillingController extends GetxController {
  final RxList<BillModel> bills = <BillModel>[].obs;
  final RxList<BillModel> filteredBills = <BillModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString filterStatus = 'All'.obs;

  // Generate bill form
  final RxString selectedCustomerId = ''.obs;
  final RxList<BillItemModel> billItems = <BillItemModel>[].obs;
  final discountController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _load();
    ever(filterStatus, (_) => _applyFilter());
  }

  @override
  void onClose() {
    discountController.dispose();
    notesController.dispose();
    super.onClose();
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    bills.assignAll(DummyData.bills);
    filteredBills.assignAll(bills);
    isLoading.value = false;
  }

  void _applyFilter() {
    if (filterStatus.value == 'All') {
      filteredBills.assignAll(bills);
    } else {
      filteredBills.assignAll(bills.where((b) => b.statusLabel == filterStatus.value));
    }
  }

  void setFilter(String status) => filterStatus.value = status;

  void addItemToBill(ProductModel product, int qty) {
    final existing = billItems.indexWhere((i) => i.productId == product.id);
    if (existing != -1) {
      final old = billItems[existing];
      billItems[existing] = BillItemModel(
        productId: old.productId,
        productName: old.productName,
        unit: old.unit,
        quantity: old.quantity + qty,
        unitPrice: old.unitPrice,
      );
    } else {
      billItems.add(BillItemModel(
        productId: product.id,
        productName: product.name,
        unit: product.unit,
        quantity: qty,
        unitPrice: product.price,
      ));
    }
  }

  void removeItem(int index) => billItems.removeAt(index);

  double get billSubtotal => billItems.fold(0, (s, i) => s + i.subtotal);
  double get billDiscount => double.tryParse(discountController.text) ?? 0;
  double get billTotal {
    final sub = billSubtotal;
    final disc = sub * (billDiscount / 100);
    final taxable = sub - disc;
    return taxable + taxable * 0.18;
  }

  void generateBill() {
    if (selectedCustomerId.isEmpty || billItems.isEmpty) {
      Get.snackbar('Error', 'Please select customer and add items',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFEF233C),
          colorText: Colors.white);
      return;
    }
    final customer = DummyData.customers.firstWhere((c) => c.id == selectedCustomerId.value);
    final bill = BillModel(
      id: 'b${bills.length + 1}',
      billNumber: 'INV-2024-00${bills.length + 1}',
      customerId: customer.id,
      customerName: customer.name,
      items: List.from(billItems),
      createdAt: DateTime.now(),
      status: BillStatus.pending,
      discount: billDiscount,
      notes: notesController.text,
    );
    bills.insert(0, bill);
    filteredBills.insert(0, bill);
    billItems.clear();
    selectedCustomerId.value = '';
    discountController.clear();
    notesController.clear();
    Get.back();
    Get.snackbar('Bill Generated', 'Bill ${bill.billNumber} created',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF06D6A0),
        colorText: Colors.white);
  }

  // Stats
  double get totalRevenue => bills.where((b) => b.status == BillStatus.paid).fold(0, (s, b) => s + b.totalAmount);
  int get pendingCount => bills.where((b) => b.status == BillStatus.pending).length;
}