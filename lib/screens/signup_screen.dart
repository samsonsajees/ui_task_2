import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/screens/onboarding_screen.dart';
import 'package:ui_task_2/widgets/text_field.dart';
import 'package:ui_task_2/widgets/field_label.dart';
import 'package:ui_task_2/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true, 
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text("Sign up", style: AppTextStyles.h1.copyWith(color: AppColors.black)),
                    const SizedBox(height: 8),
                    Text("Create an account to get started", style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight)),
                    
                    const SizedBox(height: 24),
              
                    const FieldLabel(text: "Name"),
                    const AuthTextField(hint: "Name"),
                    
                    const SizedBox(height: 16),
              
                    const FieldLabel(text: "Email Address"),
                    const AuthTextField(hint: "name@email.com"),
              
                    const SizedBox(height: 16),
              
                    const FieldLabel(text: "Password"),
                    const AuthTextField(hint: "Create a password", isPassword: true),
              
                    const SizedBox(height: 16),
              
                    const AuthTextField(hint: "Confirm password", isPassword: true),
              
                    const SizedBox(height: 24),
              
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              value: isChecked,
                              activeColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              side: BorderSide(color: AppColors.whiteDarkest, width: 1.3),
                              onChanged: (v) => setState(() => isChecked = v!),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                        child: RichText(
                          text:TextSpan(
                            // Sets the global size and line height for the block here
                            style: TextStyle(color: AppColors.greyLight, fontSize: 14, height: 1.1,letterSpacing: .2),
                            children: [
                              TextSpan(
                                text: "I've read and agree with the ",
                                style: AppTextStyles.bodyS.copyWith(color: AppColors.greyLight, fontSize: 13),
                              ),
                              TextSpan(
                                text: "Terms and Conditions",
                                style: AppTextStyles.actionM.copyWith(color: AppColors.primaryBlue, fontSize: 13),
                              ),
                              TextSpan(
                                text: " and the ",
                                style: AppTextStyles.bodyS.copyWith(color: AppColors.greyLight, fontSize: 13),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: AppTextStyles.actionM.copyWith(color: AppColors.primaryBlue, fontSize: 13),
                              ),
                              TextSpan(text: "."),
                            ],
                          ),
                        ),
                      )
                      ],
                    ),
                    const SizedBox(height: 24),
        
                    PrimaryButton(
                    text: "Sign Up",
                    onPressed: () {
                      print("Sign Up pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OnboardingPage()),
                      );
                    },
                  ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}