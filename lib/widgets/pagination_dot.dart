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
        color: isActive ? AppColors.primaryBlue : AppColors.whiteDarkest.withOpacity(0.5),
      ),
    );
  }
}