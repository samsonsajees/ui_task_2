import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color _hexToColor(String hex) {
    return Color(int.parse("FF${hex.replaceAll('#', '')}", radix: 16));
  }

  static final Color primaryBlue = _hexToColor("006FFD");
  static final Color whiteDarkest = _hexToColor("C5C6CC");
  static final Color greyLightest = _hexToColor("8F9098");  
  static final Color greyLight = _hexToColor("71727A");
  static final Color greyDarkest = _hexToColor("1E1E1E");
  static final Color greyDark = _hexToColor("2F3036");
  static final Color black = _hexToColor("000000");
  static final Color white = _hexToColor("FFFFFF");
  static final Color divider = _hexToColor("D4D6DD");
}