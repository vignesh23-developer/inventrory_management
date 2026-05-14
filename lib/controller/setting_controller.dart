import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customer_bills.dart';
import '../models/inventory_data.dart';

class CustomerManagementController extends GetxController {
  final RxList<CustomerModel> customers = <CustomerModel>[].obs;
  final RxList<CustomerModel> filtered = <CustomerModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
    debounce(searchQuery, (_) => _filter(), time: const Duration(milliseconds: 300));
  }

  Future<void> _load() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    customers.assignAll(DummyData.customers);
    filtered.assignAll(customers);
    isLoading.value = false;
  }

  void _filter() {
    final q = searchQuery.value.toLowerCase();
    filtered.assignAll(q.isEmpty
        ? customers
        : customers.where((c) =>
    c.name.toLowerCase().contains(q) ||
        c.email.toLowerCase().contains(q)));
  }

  void setSearch(String q) => searchQuery.value = q;

  int get totalCustomers => customers.length;
  int get activeCustomers => customers.where((c) => c.isActive).length;
  double get totalRevenue => customers.fold(0, (s, c) => s + c.totalSpent);
}


class SettingsController extends GetxController {
  final RxBool isDarkMode = false.obs;
  final RxBool notificationsEnabled = true.obs;
  final RxBool emailAlerts = true.obs;
  final RxBool lowStockAlerts = true.obs;
  final RxString currency = 'INR'.obs;
  final RxString language = 'English'.obs;
  final RxDouble taxRate = 18.0.obs;

  void toggleDarkMode() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleNotifications() => notificationsEnabled.toggle();
  void toggleEmailAlerts() => emailAlerts.toggle();
  void toggleLowStockAlerts() => lowStockAlerts.toggle();
  void setCurrency(String val) => currency.value = val;
  void setLanguage(String val) => language.value = val;
  void setTaxRate(double val) => taxRate.value = val;
}