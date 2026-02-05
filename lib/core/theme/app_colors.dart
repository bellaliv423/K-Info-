import 'package:flutter/material.dart';

class AppColors {
  // Primary color - Blue
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);

  // Secondary color - Orange
  static const Color secondary = Color(0xFFFF6B35);
  static const Color secondaryLight = Color(0xFFFF8A50);
  static const Color secondaryDark = Color(0xFFE55100);

  // Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);

  // Card and Surface colors
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);
  static const Color surface = Color(0xFFFAFAFA);
  static const Color surfaceDark = Color(0xFF1F1F1F);

  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Border and divider
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color dividerDark = Color(0xFF37474F);

  // Gradient colors
  static const Color gradientStart = Color(0xFF1E88E5);
  static const Color gradientEnd = Color(0xFF42A5F5);

  // Grey shades
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);

  // Shimmer colors
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // Transparency variants
  static Color primaryWithOpacity(double opacity) =>
      primary.withOpacity(opacity);
  static Color secondaryWithOpacity(double opacity) =>
      secondary.withOpacity(opacity);
  static Color textPrimaryWithOpacity(double opacity) =>
      textPrimary.withOpacity(opacity);
}
