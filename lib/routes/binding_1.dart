import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// lib/app/bindings/admin_binding.dart (inline)
// ─────────────────────────────────────────────────────────────────────────────