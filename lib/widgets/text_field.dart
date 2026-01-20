import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final double height;

  const AuthTextField({
    super.key,
    required this.hint,
    this.height = 48,
    this.isPassword = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextField(
        cursorHeight: 16,
        cursorColor: AppColors.primaryBlue,
        style: AppTextStyles.bodyM.copyWith(color: AppColors.greyDarkest),
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTextStyles.bodyM.copyWith(color: AppColors.greyLightest),
          
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                    color: AppColors.greyLightest,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}