import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.greyDark, fontFamily: 'Inter'),
      ),
    );
  }
}