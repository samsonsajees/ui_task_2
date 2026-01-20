import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class PaginationIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const PaginationIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: _PaginationDot(isActive: currentIndex == index),
        );
      }),
    );
  }
}

class _PaginationDot extends StatelessWidget {
  final bool isActive;

  const _PaginationDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryBlue : AppColors.whiteDarkest.withValues(alpha: 0.5),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double progress;

  const AnimatedProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          tween: Tween<double>(begin: 0, end: progress),
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: const Color(0xFFF2F2F5),
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}*/