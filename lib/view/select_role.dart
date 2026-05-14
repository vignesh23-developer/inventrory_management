// lib/app/views/auth/role_select_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../const/color_themes.dart';
import '../controller/auth_controller.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<AuthController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
                  ),
                  onPressed: () => Get.back(),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Select Your',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Role',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Choose how you want to access\nStockMaster today.',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 6.h),
                // Admin card
                Obx(() => _RoleCard(
                  icon: Icons.admin_panel_settings_rounded,
                  title: 'Administrator',
                  subtitle: 'Full access to inventory, billing,\ncustomers and analytics.',
                  colors: AppColors.primaryGradient,
                  features: const ['Dashboard & Analytics', 'Product Management', 'Billing & Invoicing', 'Customer Management'],
                  isLoading: ctrl.isLoading.value,
                  onTap: () => ctrl.loginAs(UserRole.admin),
                )),
                SizedBox(height: 3.h),
                Obx(() => _RoleCard(
                  icon: Icons.person_rounded,
                  title: 'Customer',
                  subtitle: 'Browse products, track orders\nand view your invoices.',
                  colors: AppColors.accentGradient,
                  features: const ['Product Catalogue', 'Request Products', 'Bills & Invoices', 'Profile Management'],
                  isLoading: ctrl.isLoading.value,
                  onTap: () => ctrl.loginAs(UserRole.customer),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> colors;
  final List<String> features;
  final bool isLoading;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colors,
    required this.features,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(color: colors.first.withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6)),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withOpacity(0.55),
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: features
                        .map((f) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: colors.first.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(f,
                          style: GoogleFonts.plusJakartaSans(
                              color: Colors.white, fontSize: 9, fontWeight: FontWeight.w600)),
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }
}