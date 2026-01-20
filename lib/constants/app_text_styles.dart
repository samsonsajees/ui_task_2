import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor

  // ---------------------------------------------------------------------------
  // HEADINGS
  // ---------------------------------------------------------------------------
  
  // H1: Extra bold / 24
  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest, 
  );

  // H2: Extra bold / 18
  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest,
  );

  // H3: Extra bold / 16
  static TextStyle h3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest,
  );

  // H4: Bold / 14
  static TextStyle h4 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.greyDarkest,
  );

  // H5: Bold / 12
  static TextStyle h5 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.greyDarkest,
  );

  // ---------------------------------------------------------------------------
  // BODY
  // ---------------------------------------------------------------------------

  // XL: Regular / 18
  static TextStyle bodyXL = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight, 
  );

  // L: Regular / 16
  static TextStyle bodyL = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // M: Regular / 14
  static TextStyle bodyM = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // S: Regular / 12
  static TextStyle bodyS = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // XS: Medium / 10
  static TextStyle bodyXS = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.greyLight,
  );

  // ---------------------------------------------------------------------------
  // ACTION (Buttons / Links)
  // ---------------------------------------------------------------------------

  // L: Semi Bold / 14
  static TextStyle actionL = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue, // Default to primary for actions
  );

  // M: Semi Bold / 12
  static TextStyle actionM = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
  );

  // S: Semi Bold / 10
  static TextStyle actionS = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
  );

  // ---------------------------------------------------------------------------
  // CAPTION
  // ---------------------------------------------------------------------------

  // M: Semi Bold / 10
  static TextStyle captionM = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.greyLight,
  );
}