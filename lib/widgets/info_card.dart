import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class BuildInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const BuildInfoCard({required this.label, required this.value, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.searchBar,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight)),
              const SizedBox(height: 4),
              Text(value, style: AppTextStyles.h4.copyWith(color: AppColors.greyDarkest)),
            ],
          ),
        ],
      ),
    );
  }
}