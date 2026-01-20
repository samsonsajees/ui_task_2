import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/widgets/text_field.dart';
import 'package:ui_task_2/screens/signup_screen.dart';
import 'package:ui_task_2/widgets/social_button.dart';
import 'package:ui_task_2/widgets/primary_button.dart';

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
                'assets/coffee-can.png',
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
                    style: TextStyle(fontSize: 28,letterSpacing: .3, fontWeight: FontWeight.w900, color: AppColors.black, fontFamily: 'Inter'),
                  ),
                  const SizedBox(height: 24),
                  
                  const AuthTextField(hint: "Email Address"),
                  const SizedBox(height: 16),
                  
                  const AuthTextField(hint: "Password", isPassword: true),
                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        print("Forgot password tapped");
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: AppColors.primaryBlue,fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: .1),
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
                        Text("Not a member? ", style: TextStyle(color: AppColors.greyLight, fontSize: 13, letterSpacing: .1)),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
                          child: Text("Register now", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.w700,letterSpacing: .1, fontSize: 13)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Divider(color: AppColors.divider, thickness: 1),
                  const SizedBox(height: 24),

                  Center(child: Text("Or continue with", style: TextStyle(color: AppColors.greyLight, fontSize: 13))),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(onTap: () {
                        print("Google sign-in pressed");
                      }, child: SocialButton(asset: 'assets/google.svg')),
                      GestureDetector(onTap: () {
                        print("Apple sign-in pressed");
                      }, child: SocialButton(asset: 'assets/apple.svg')),
                      GestureDetector(onTap: () {
                        print("Facebook sign-in pressed");
                      }, child: SocialButton(asset: 'assets/fb.svg')),
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