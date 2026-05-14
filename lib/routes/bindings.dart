import 'package:get/get.dart';
import 'package:inventory_management/routes/routes.dart';

import '../view/a_dashboard.dart';
import '../view/admin_bottom.dart';
import '../view/role_screen.dart';
import '../view/select_role.dart';
import '../view/splash_screen.dart';
import 'admin_binding.dart';
import 'binding_1.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.splash;

  static final List<GetPage> pages = [
    // ── Auth ─────────────────────────────────────────────────────────────────
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.roleSelect,
      page: () => const RoleSelectScreen(),
      transition: Transition.rightToLeft,
    ),

    // ── Admin ────────────────────────────────────────────────────────────────
    GetPage(
      name: AppRoutes.adminMain,
      page: () => const AdminMainScreen(),
      binding: AdminBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.adminProducts,
    //   page: () => const ProductListScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.adminAddProduct,
    //   page: () => const AddEditProductScreen(),
    //   transition: Transition.downToUp,
    // ),
    // GetPage(
    //   name: AppRoutes.adminEditProduct,
    //   page: () => const AddEditProductScreen(isEdit: true),
    //   transition: Transition.downToUp,
    // ),
    // GetPage(
    //   name: AppRoutes.adminBilling,
    //   page: () => const BillingListScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.adminGenerateBill,
    //   page: () => const GenerateBillScreen(),
    //   transition: Transition.downToUp,
    // ),
    // GetPage(
    //   name: AppRoutes.adminCustomers,
    //   page: () => const CustomerListScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.adminSettings,
    //   page: () => const SettingsScreen(),
    // ),
    //
    // // ── Customer ─────────────────────────────────────────────────────────────
    // GetPage(
    //   name: AppRoutes.customerMain,
    //   page: () => const CustomerMainScreen(),
    //   binding: CustomerBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: AppRoutes.customerHome,
    //   page: () => const CustomerHomeScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.customerProducts,
    //   page: () => const ProductListingScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.customerProductDetail,
    //   page: () => const ProductDetailScreen(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: AppRoutes.customerRequestProduct,
    //   page: () => const RequestProductScreen(),
    //   transition: Transition.downToUp,
    // ),
    // GetPage(
    //   name: AppRoutes.customerBills,
    //   page: () => const BillListScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.customerInvoiceDetail,
    //   page: () => const InvoiceDetailScreen(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: AppRoutes.customerProfile,
    //   page: () => const ProfileScreen(),
    // ),
  ];
}