

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller/customer_controller.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerHomeController>(() => CustomerHomeController());
    Get.lazyPut<CustomerProductController>(() => CustomerProductController());
    Get.lazyPut<CustomerBillController>(() => CustomerBillController());
    Get.lazyPut<CustomerProfileController>(() => CustomerProfileController());
  }
}