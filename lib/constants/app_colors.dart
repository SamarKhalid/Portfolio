import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0A84FF);
  static const accent = Color(0xFF6C63FF);
  static const background = Color(0xFFF7F8FA);
  static const text = Color(0xFF0F1724);
  static const muted = Color(0xFF6B7280);
  static const whiteText = Color(0xFFFFFFFF);

  // Gradient colors
  static const gradientStart = Color(0xFF667eea);
  static const gradientMiddle = Color(0xFF764ba2);
  static const gradientEnd = Color(0xFFf093fb);

  static const gradientStart2 = Color(0xFF4facfe);
  static const gradientEnd2 = Color(0xFF00f2fe);

  // Main app gradient
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientMiddle, gradientEnd],
    stops: [0.0, 0.5, 1.0],
  );

  // Alternative gradient for sections
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientStart2, gradientEnd2],
  );

  // Subtle overlay gradient
  static const LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x40667eea), Color(0x40764ba2), Color(0x40f093fb)],
  );
}
