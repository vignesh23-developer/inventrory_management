import 'package:get/get.dart';

import '../models/customer_bills.dart';
import '../models/inventory_data.dart';
import '../models/models.dart';

class CustomerHomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final RxString greeting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
    _setGreeting();
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 700));
    featuredProducts.assignAll(DummyData.products.take(4).toList());
    isLoading.value = false;
  }

  void _setGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting.value = 'Good Morning';
    } else if (hour < 17) {
      greeting.value = 'Good Afternoon';
    } else {
      greeting.value = 'Good Evening';
    }
  }
}


class CustomerProductController extends GetxController {
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> filtered = <ProductModel>[].obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;
  final RxBool isLoading = true.obs;
  final RxBool isGridView = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
    debounce(searchQuery, (_) => _applyFilter(), time: const Duration(milliseconds: 300));
    ever(selectedCategory, (_) => _applyFilter());
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    products.assignAll(DummyData.products.where((p) => p.isActive).toList());
    filtered.assignAll(products);
    isLoading.value = false;
  }

  void _applyFilter() {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    filtered.assignAll(products.where((p) {
      final matchCat = cat == 'All' || p.category == cat;
      final matchQ = q.isEmpty || p.name.toLowerCase().contains(q);
      return matchCat && matchQ;
    }));
  }

  void setCategory(String c) => selectedCategory.value = c;
  void setSearch(String q) => searchQuery.value = q;
  void toggleView() => isGridView.toggle();
}

class CustomerBillController extends GetxController {
  final RxList<BillModel> bills = <BillModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    // Filter bills for current customer (c1 as demo)
    bills.assignAll(DummyData.bills.where((b) => b.customerId == 'c1'));
    isLoading.value = false;
  }
}

class CustomerProfileController extends GetxController {
  final currentCustomer = DummyData.customers.first.obs;
  final RxBool isEditing = false.obs;

  void toggleEdit() => isEditing.toggle();
  void saveProfile() {
    isEditing.value = false;
    Get.snackbar('Saved', 'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM);
  }
}
