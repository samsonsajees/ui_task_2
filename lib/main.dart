import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/screens/chats_Screen.dart';
import 'package:ui_task_2/screens/chat_detail_screen.dart';
import 'package:ui_task_2/screens/chats_screen.dart';
import 'package:ui_task_2/screens/login_screen.dart';
import 'package:ui_task_2/screens/test_ui.dart';

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
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.primaryBlue,
        useMaterial3: true     
      ),
      home: const LoginPage(),
    );
  }
}
