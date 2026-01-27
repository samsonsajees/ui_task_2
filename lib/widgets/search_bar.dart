import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.searchBar,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Center(
          child: TextField(
            style: AppTextStyles.bodyL.copyWith(color: AppColors.greyDarkest),
            cursorColor: AppColors.primaryBlue,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
          
              border: InputBorder.none,
              prefixIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 16,
                height: 16,
                fit: BoxFit.scaleDown,
              ),
              hintText: "Search",
              hintStyle: AppTextStyles.bodyL.copyWith(color: AppColors.greyLightest),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(48),
                borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.5),
              ),
          
              isDense: true,
            ),
          ),
        ),
      ),
    );
  }
}