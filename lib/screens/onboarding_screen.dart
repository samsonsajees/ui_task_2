import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/screens/interests_screen.dart';
import 'package:ui_task_2/widgets/pagination_dot.dart';
import 'package:ui_task_2/widgets/primary_button.dart';
import 'package:ui_task_2/widgets/app_network_image.dart';
import 'package:ui_task_2/constants/url_images.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [

          SizedBox(
            height: 506,
            width: double.infinity,
            child: PageView.builder(
              itemCount: UrlImages.onboardingImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  color: const Color(0xFFE9F4FF),
                  child: AppNetworkImage(
                    imageUrl: UrlImages.onboardingImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
                                  

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 16),
                  PaginationIndicator(
                    itemCount: UrlImages.onboardingImages.length,
                    currentIndex: _currentIndex,
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "Create a prototype in just a few minutes",
                    style: AppTextStyles.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    "Enjoy these pre-made components and worry only about creating the best product ever.",
                    style: AppTextStyles.bodyS.copyWith(color: AppColors.greyLight),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 32),

                  PrimaryButton(
                    text: "Next",
                    onPressed: () {
                      print("Next pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const InterestsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}