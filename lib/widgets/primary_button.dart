import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width=double.infinity;

  const PrimaryButton({
    super.key,
    required this.text,
    this.height = 48,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
         onTap : onPressed,
        child : Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: AppTextStyles.actionM.copyWith(color: AppColors.white),
          ),
        ),


        //onPressed: onPressed,
        //style: ElevatedButton.styleFrom(
          //backgroundColor: AppColors.primaryBlue,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          //elevation: 0,
        //),
        //child: Text(
          //text,
          //style: AppTextStyles.actionM.copyWith(color: AppColors.white),
        //),
      ),
    );
  }
}