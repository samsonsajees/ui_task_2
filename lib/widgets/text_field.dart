import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  
  const AuthTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        cursorHeight: 16,
        cursorColor: AppColors.primaryBlue,
        style: TextStyle(color: AppColors.greyDarkest, fontSize: 14,height: 2,fontFamily: 'Inter'),
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.greyLightest, fontSize: 14,height: 2,fontFamily: 'Inter'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: isPassword
              ? Icon(Icons.visibility_off_sharp, color: AppColors.greyLightest,size: 20,)
              : null,
        ),
      ),
    );
  }
}
