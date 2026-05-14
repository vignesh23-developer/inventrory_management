// lib/app/routes/app_routes.dart
// Named route constants for the entire application

abstract class AppRoutes {
  AppRoutes._();

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String splash = '/splash';
  static const String login = '/login';
  static const String roleSelect = '/role-select';

  // ── Admin ──────────────────────────────────────────────────────────────────
  static const String adminMain = '/admin';
  static const String adminDashboard = '/admin/dashboard';
  static const String adminProducts = '/admin/products';
  static const String adminAddProduct = '/admin/products/add';
  static const String adminEditProduct = '/admin/products/edit';
  static const String adminBilling = '/admin/billing';
  static const String adminGenerateBill = '/admin/billing/generate';
  static const String adminCustomers = '/admin/customers';
  static const String adminSettings = '/admin/settings';

  // ── Customer ──────────────────────────────────────────────────────────────
  static const String customerMain = '/customer';
  static const String customerHome = '/customer/home';
  static const String customerProducts = '/customer/products';
  static const String customerProductDetail = '/customer/products/detail';
  static const String customerRequestProduct = '/customer/request';
  static const String customerBills = '/customer/bills';
  static const String customerInvoiceDetail = '/customer/bills/invoice';
  static const String customerProfile = '/customer/profile';
}