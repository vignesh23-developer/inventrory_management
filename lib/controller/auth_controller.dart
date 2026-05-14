import 'package:get/get.dart';

import '../routes/routes.dart';

enum UserRole { admin, customer }

class AuthController extends GetxController {
  // ── Observables ─────────────────────────────────────────────────────────
  final Rx<UserRole?> currentRole = Rx<UserRole?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // ── Login ────────────────────────────────────────────────────────────────
  Future<void> loginAs(UserRole role) async {
    isLoading.value = true;
    errorMessage.value = '';

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1200));

    currentRole.value = role;
    isLoading.value = false;

    if (role == UserRole.admin) {
      Get.offAllNamed(AppRoutes.adminMain);
    } else {
      Get.offAllNamed(AppRoutes.customerMain);
    }
  }

  void logout() {
    currentRole.value = null;
    Get.offAllNamed(AppRoutes.login);
  }

  bool get isAdmin => currentRole.value == UserRole.admin;
}