import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/widgets/text_field.dart';
import 'package:ui_task_2/screens/signup_screen.dart';
import 'package:ui_task_2/widgets/social_button.dart';
import 'package:ui_task_2/widgets/primary_button.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 312,
              width: double.infinity,
              child: Image.asset(
                'assets/images/coffee-can.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: AppTextStyles.h1.copyWith(fontSize: 28, color: AppColors.black),
                  ),
                  const SizedBox(height: 24),
                  
                  const AuthTextField(hint: "Email Address"),
                  const SizedBox(height: 16),
                  
                  const AuthTextField(hint: "Password", isPassword: true, ),
                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        print("Forgot password tapped");
                      },
                      child: Text(
                        "Forgot password?",
                        style: AppTextStyles.actionM.copyWith(color: AppColors.primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      print("Login pressed");
                    },
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member? ", style: AppTextStyles.bodyS.copyWith(color: AppColors.greyLight)),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
                          child: Text("Register now", style: AppTextStyles.actionM.copyWith(color: AppColors.primaryBlue)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Divider(color: AppColors.divider, thickness: 1),
                  const SizedBox(height: 24),

                  Center(child: Text("Or continue with", style: AppTextStyles.bodyS.copyWith(color: AppColors.greyLight))),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(onTap: () {
                        print("Google sign-in pressed");
                      }, child: SocialButton(asset: 'assets/icons/google.svg')),
                      GestureDetector(onTap: () {
                        print("Apple sign-in pressed");
                      }, child: SocialButton(asset: 'assets/icons/apple.svg')),
                      GestureDetector(onTap: () {
                        print("Facebook sign-in pressed");
                      }, child: SocialButton(asset: 'assets/icons/fb.svg')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}