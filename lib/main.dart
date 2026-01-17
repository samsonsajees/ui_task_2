import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF0066FF),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ------------------- WIDGETS -------------------

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
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 157, 157, 157)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 195, 195, 195), width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF0066FF), width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off_sharp, color: Color.fromARGB(255, 143, 143, 143),size: 22,)
            : null,
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
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.8, color: Colors.black87),
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
              height: 340,
              width: double.infinity,
              child: Image.asset(
                'assets/coffee-can.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 28,letterSpacing: .3, fontWeight: FontWeight.w900, color: Colors.black,height: 1.0),
                  ),
                  const SizedBox(height: 31),
                  
                  const AuthTextField(hint: "Email Address"),
                  const SizedBox(height: 16),
                  
                  const AuthTextField(hint: "Password", isPassword: true),
                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Color.fromARGB(255, 26, 108, 232), fontWeight: FontWeight.w700, letterSpacing: .1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 108, 232),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not a member? ", style: TextStyle(color: Color.fromARGB(255, 112, 112, 112), fontSize: 13.5, letterSpacing: .1)),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
                          child: const Text("Register now", style: TextStyle(color: Color.fromARGB(255, 50, 122, 230), fontWeight: FontWeight.w800,letterSpacing: .1, fontSize: 13.5)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Divider(color: Colors.grey[300], thickness: 1),
                  const SizedBox(height: 15),

                  const Center(child: Text("Or continue with", style: TextStyle(color: Color.fromARGB(255, 112, 112, 112), fontSize: 13.7))),
                  const SizedBox(height: 8),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(asset: 'assets/google.svg'),
                      SocialButton(asset: 'assets/apple.svg'),
                      SocialButton(asset: 'assets/fb.svg'),
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
      backgroundColor: Colors.white,
      // Ensure the scaffold resizes when keyboard opens (default is true)
      resizeToAvoidBottomInset: true, 
      body: Column(
        children: [
          // This header space stays fixed
          const SizedBox(
            height: 70,
            width: double.infinity,
          ),
          
          // ADDED: Expanded makes the scroll view fill only the remaining space
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sign up", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text("Create an account to get started", style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  
                  const SizedBox(height: 23),
            
                  const FieldLabel(text: "Name"),
                  const AuthTextField(hint: "name"),
                  
                  const SizedBox(height: 14),
            
                  const FieldLabel(text: "Email Address"),
                  const AuthTextField(hint: "name@email.com"),
            
                  const SizedBox(height: 14),
            
                  const FieldLabel(text: "Password"),
                  const AuthTextField(hint: "Create a password", isPassword: true),
            
                  const SizedBox(height: 14),
            
                  const AuthTextField(hint: "Confirm password", isPassword: true),
            
                  const SizedBox(height: 28),
            
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
                            activeColor: const Color.fromARGB(255, 61, 117, 201),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            side: const BorderSide(color: Color.fromARGB(255, 209, 209, 209), width: 1.3),
                            onChanged: (v) => setState(() => isChecked = v!),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                      child: RichText(
                        text: const TextSpan(
                          // Set global size and line height for this block here
                          style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.1,letterSpacing: .2),
                          children: [
                            TextSpan(
                              text: "I've read and agree with the ",
                              style: TextStyle(color: Color.fromARGB(255, 121, 121, 121)),
                            ),
                            TextSpan(
                              text: "Terms and      Conditions",
                              style: TextStyle(color: Color.fromARGB(255, 59, 131, 239), fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: " and the ",
                              style: TextStyle(color: Color.fromARGB(255, 121, 121, 121)),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Color.fromARGB(255, 59, 131, 239), fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                      ),
                    )
                    ],
                  ),
                  // Add extra padding at the bottom so the last element isn't hidden behind the keyboard
                  const SizedBox(height: 77),

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
                        backgroundColor: const Color.fromARGB(255, 26, 108, 232),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 15),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}