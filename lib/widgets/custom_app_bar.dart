import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final bool showDivider;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.showDivider = false,
  });

  static const double _toolbarHeight = 56;

  @override
  Size get preferredSize => const Size.fromHeight(
        _toolbarHeight + 24, // safe default, real value handled dynamically
      );

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Material(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //STATUS BAR SAFE AREA
          SizedBox(height: statusBarHeight),

          // ACTUAL APP BAR
          SizedBox(
            height: _toolbarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    child: leading ?? const SizedBox.shrink(),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h4.copyWith(
                        fontSize: 15,
                        color: AppColors.greyDarkest,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: trailing ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),

          if (showDivider)
            Container(height: 1, color: AppColors.divider),
        ],
      ),
    );
  }
}
