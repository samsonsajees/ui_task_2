import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class InterestOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selected : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.whiteDarkest,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.greyDarkest,
                fontFamily: 'Inter',
              ),
            ),
            if (isSelected)
              SizedBox(child: Icon(Icons.check, color: AppColors.primaryBlue, size: 20)),
          ],
        ),
      ),
    );
  }
}