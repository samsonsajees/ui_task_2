import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_task_2/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.primaryBlue,
        useMaterial3: true,

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.whiteDarkest, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.5),
          ),
        ),
        
      ),
      home: const LoginPage(),
    );
  }
}


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

class SocialButton extends StatelessWidget {
  final String asset;
  const SocialButton({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        asset,
        height: 44,
        width: 44,
      ),
    );
  }
}

// ------------------- LOGIN PAGE -------------------

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

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Login pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Text("Login", style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    
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

// ------------------- SIGN UP PAGE -------------------

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
                    Text("Sign up", style: TextStyle(fontSize: 19,color: AppColors.greyDarkest, fontWeight: FontWeight.w900, fontFamily: 'Inter')),
                    const SizedBox(height: 8),
                    Text("Create an account to get started", style: TextStyle(fontSize: 14, color: AppColors.greyLight, fontFamily: 'Inter')),
                    
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
                            // Set global size and line height for this block here
                            style: TextStyle(color: AppColors.greyLight, fontSize: 14, height: 1.1,letterSpacing: .2),
                            children: [
                              TextSpan(
                                text: "I've read and agree with the ",
                                style: TextStyle(color: AppColors.greyLight, fontSize: 14, fontFamily: 'Inter'),
                              ),
                              TextSpan(
                                text: "Terms and   Conditions",
                                style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Inter'),
                              ),
                              TextSpan(
                                text: " and the ",
                                style: TextStyle(color: AppColors.greyLight,fontSize: 14, fontFamily: 'Inter'),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Inter'),
                              ),
                              TextSpan(text: "."),
                            ],
                          ),
                        ),
                      )
                      ],
                    ),
                    const SizedBox(height: 24),
        
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const LoginPage())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: Text("Sign Up", style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
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