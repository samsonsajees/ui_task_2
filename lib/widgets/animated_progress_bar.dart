import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0, end: progress),
        builder: (context, value, _) => Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.progress,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: value,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}