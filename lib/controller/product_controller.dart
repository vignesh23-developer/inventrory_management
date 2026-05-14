import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/inventory_data.dart';
import '../models/models.dart';

class ProductController extends GetxController {
  // ── State ──────────────────────────────────────────────────────────────
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<ProductModel> filtered = <ProductModel>[].obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString searchQuery = ''.obs;
  final RxBool isLoading = true.obs;

  // ── Form controllers for Add/Edit ──────────────────────────────────────
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final minStockController = TextEditingController();
  final skuController = TextEditingController();
  final unitController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _load();
    debounce(searchQuery, (_) => _applyFilter(), time: const Duration(milliseconds: 300));
    ever(selectedCategory, (_) => _applyFilter());
  }

  @override
  void onClose() {
    nameController.dispose();
    categoryController.dispose();
    descController.dispose();
    priceController.dispose();
    stockController.dispose();
    minStockController.dispose();
    skuController.dispose();
    unitController.dispose();
    super.onClose();
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    products.assignAll(DummyData.products);
    filtered.assignAll(products);
    isLoading.value = false;
  }

  void _applyFilter() {
    final q = searchQuery.value.toLowerCase();
    final cat = selectedCategory.value;
    filtered.assignAll(products.where((p) {
      final matchCat = cat == 'All' || p.category == cat;
      final matchQ = q.isEmpty || p.name.toLowerCase().contains(q) || p.sku.toLowerCase().contains(q);
      return matchCat && matchQ;
    }));
  }

  void setCategory(String cat) => selectedCategory.value = cat;
  void setSearch(String q) => searchQuery.value = q;

  // ── CRUD ───────────────────────────────────────────────────────────────
  void addProduct() {
    final product = ProductModel(
      id: 'p${products.length + 1}',
      name: nameController.text.trim(),
      category: categoryController.text.trim(),
      description: descController.text.trim(),
      price: double.tryParse(priceController.text) ?? 0,
      stock: int.tryParse(stockController.text) ?? 0,
      minStock: int.tryParse(minStockController.text) ?? 5,
      imageUrl: 'https://picsum.photos/seed/${nameController.text}/400/300',
      sku: skuController.text.trim(),
      unit: unitController.text.trim(),
    );
    products.add(product);
    _applyFilter();
    _clearForm();
    Get.back();
    Get.snackbar('Success', 'Product added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF06D6A0),
        colorText: Colors.white);
  }

  void editProduct(String id) {
    final idx = products.indexWhere((p) => p.id == id);
    if (idx == -1) return;
    final updated = products[idx].copyWith(
      name: nameController.text.trim(),
      price: double.tryParse(priceController.text) ?? products[idx].price,
      stock: int.tryParse(stockController.text) ?? products[idx].stock,
    );
    products[idx] = updated;
    _applyFilter();
    _clearForm();
    Get.back();
    Get.snackbar('Updated', 'Product updated successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  void deleteProduct(String id) {
    products.removeWhere((p) => p.id == id);
    _applyFilter();
    Get.snackbar('Deleted', 'Product removed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFEF233C),
        colorText: Colors.white);
  }

  void populateForm(ProductModel product) {
    nameController.text = product.name;
    categoryController.text = product.category;
    descController.text = product.description;
    priceController.text = product.price.toString();
    stockController.text = product.stock.toString();
    minStockController.text = product.minStock.toString();
    skuController.text = product.sku;
    unitController.text = product.unit;
  }

  void _clearForm() {
    for (final c in [nameController, categoryController, descController, priceController, stockController, minStockController, skuController, unitController]) {
      c.clear();
    }
  }

  // ── Stats ──────────────────────────────────────────────────────────────
  int get totalProducts => products.length;
  int get lowStockCount => products.where((p) => p.isLowStock).length;
  int get outOfStockCount => products.where((p) => p.isOutOfStock).length;
}