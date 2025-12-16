import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle h1(BuildContext c) => GoogleFonts.inter(
    fontSize: MediaQuery.of(c).size.width > 900 ? 40 : 28,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.whiteText,
    height: 1.4,
  );

  static TextStyle sectionTitle(BuildContext c) => GoogleFonts.inter(
    fontSize: MediaQuery.of(c).size.width > 900 ? 28 : 20,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteText,
  );
}
