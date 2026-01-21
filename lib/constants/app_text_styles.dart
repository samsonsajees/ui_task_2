import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor

  // Base text style to reduce repetition
  static const TextStyle _baseInter = TextStyle(
    fontFamily: 'Inter',
  );

  // ---------------------------------------------------------------------------
  // HEADINGS
  // ---------------------------------------------------------------------------
  
  // H1: Extra bold / 24
  static TextStyle h1 = _baseInter.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest, 
  );

  // H2: Extra bold / 18
  static TextStyle h2 = _baseInter.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest,
  );

  // H3: Extra bold / 16
  static TextStyle h3 = _baseInter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.greyDarkest,
  );

  // H4: Bold / 14
  static TextStyle h4 = _baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.greyDarkest,
  );

  // H5: Bold / 12
  static TextStyle h5 = _baseInter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.greyDarkest,
  );

  // ---------------------------------------------------------------------------
  // BODY
  // ---------------------------------------------------------------------------

  // XL: Regular / 18
  static TextStyle bodyXL = _baseInter.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight, 
  );

  // L: Regular / 16
  static TextStyle bodyL = _baseInter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // M: Regular / 14
  static TextStyle bodyM = _baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // S: Regular / 12
  static TextStyle bodyS = _baseInter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyLight,
  );

  // XS: Medium / 10
  static TextStyle bodyXS = _baseInter.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.greyLight,
  );

  // ---------------------------------------------------------------------------
  // ACTION (Buttons / Links)
  // ---------------------------------------------------------------------------

  // L: Semi Bold / 14
  static TextStyle actionL = _baseInter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue, 
  );

  // M: Semi Bold / 12
  static TextStyle actionM = _baseInter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
  );

  // S: Semi Bold / 10
  static TextStyle actionS = _baseInter.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
  );

  // ---------------------------------------------------------------------------
  // CAPTION
  // ---------------------------------------------------------------------------

  // M: Semi Bold / 10
  static TextStyle captionM = _baseInter.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.greyLight,
  );
}