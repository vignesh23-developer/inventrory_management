import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller/admin_view_controller.dart';
import '../controller/billing_controller.dart';
import '../controller/product_controller.dart';
import '../controller/setting_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<BillingController>(() => BillingController());
    Get.lazyPut<CustomerManagementController>(() => CustomerManagementController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}