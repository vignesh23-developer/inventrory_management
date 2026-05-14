// lib/app/theme/app_colors.dart
// Defines all color constants used throughout the app

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary Brand Colors ──────────────────────────────────────────────────
  static const Color primary = Color(0xFF4361EE);
  static const Color primaryLight = Color(0xFF738EFF);
  static const Color primaryDark = Color(0xFF2D40B8);

  // ── Secondary / Accent ────────────────────────────────────────────────────
  static const Color secondary = Color(0xFF7209B7);
  static const Color accent = Color(0xFFF72585);
  static const Color teal = Color(0xFF4CC9F0);

  // ── Semantic Colors ───────────────────────────────────────────────────────
  static const Color success = Color(0xFF06D6A0);
  static const Color warning = Color(0xFFFFBE0B);
  static const Color error = Color(0xFFEF233C);
  static const Color info = Color(0xFF4CC9F0);

  // ── Gradient Pairs ────────────────────────────────────────────────────────
  static const List<Color> primaryGradient = [Color(0xFF4361EE), Color(0xFF7209B7)];
  static const List<Color> accentGradient = [Color(0xFFF72585), Color(0xFF7209B7)];
  static const List<Color> tealGradient = [Color(0xFF4CC9F0), Color(0xFF4361EE)];
  static const List<Color> greenGradient = [Color(0xFF06D6A0), Color(0xFF1B998B)];
  static const List<Color> warmGradient = [Color(0xFFFFBE0B), Color(0xFFFF5400)];

  // ── Light Theme Neutrals ──────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF0F2FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightText = Color(0xFF1A1A2E);
  static const Color lightSubtext = Color(0xFF64748B);
  static const Color lightHint = Color(0xFF94A3B8);

  // ── Dark Theme Neutrals ───────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF0D0D1A);
  static const Color darkSurface = Color(0xFF151528);
  static const Color darkCard = Color(0xFF1E1E35);
  static const Color darkBorder = Color(0xFF2A2A45);
  static const Color darkText = Color(0xFFE2E8F0);
  static const Color darkSubtext = Color(0xFF94A3B8);
  static const Color darkHint = Color(0xFF64748B);

  // ── Glassmorphism ─────────────────────────────────────────────────────────
  static Color glassLight = Colors.white.withOpacity(0.15);
  static Color glassDark = Colors.black.withOpacity(0.25);
  static Color glassBorderLight = Colors.white.withOpacity(0.3);
  static Color glassBorderDark = Colors.white.withOpacity(0.08);

  // ── Chart Colors ──────────────────────────────────────────────────────────
  static const List<Color> chartColors = [
    Color(0xFF4361EE),
    Color(0xFFF72585),
    Color(0xFF4CC9F0),
    Color(0xFF06D6A0),
    Color(0xFFFFBE0B),
    Color(0xFF7209B7),
  ];
}