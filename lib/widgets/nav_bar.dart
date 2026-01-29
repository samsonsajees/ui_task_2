import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class CustomNavBar extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavBar({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    //final Color iconColor = isSelected ? AppColors.primaryBlue : AppColors.divider;
    final Color textColor = isSelected ? AppColors.greyDarkest : AppColors.greyLight;
    final FontWeight? textWeight = isSelected ? AppTextStyles.actionM.fontWeight : AppTextStyles.bodyS.fontWeight;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // Makes the entire area clickable
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.bodyS.copyWith(
              color: textColor,
              fontWeight: textWeight,
            ),
          ),
        ],
      ),
    );
  }
}