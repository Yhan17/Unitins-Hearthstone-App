import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle appTypography = GoogleFonts.poppins(
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle heroNameMd = GoogleFonts.poppins(
    color: AppColors.heroName,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle heroNameLg = GoogleFonts.poppins(
    color: AppColors.heroName,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle classNameMd = GoogleFonts.poppins(
    color: AppColors.heroClass,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle classNameLg = GoogleFonts.poppins(
    color: AppColors.heroClass,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
