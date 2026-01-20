import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/screens/interests_screen.dart';
import 'package:ui_task_2/widgets/pagination_dot.dart';
import 'package:ui_task_2/widgets/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // 1. State variable to track the current page
  int _currentIndex = 0;

  // 2. List of 3 Online Image URLs
  final List<String> _onboardingImages = [
    'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Collaboration/Team
    'https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Tech/Development
    'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Planning/Strategy
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // --- SWIPABLE IMAGE SECTION ---
          SizedBox(
            height: 506,
            width: double.infinity,
            child: PageView.builder(
              itemCount: _onboardingImages.length,
              // 3. Update state when user swipes
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  color: const Color(0xFFE9F4FF), // Background fallback
                  child: Image.network(
                    _onboardingImages[index],
                    fit: BoxFit.cover,
                    // Loading builder ensures a nice experience while fetching from web
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / 
                                loadingProgress.expectedTotalBytes!
                              : null,
                          color: AppColors.primaryBlue,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image_outlined, 
                      size: 80, 
                      color: AppColors.primaryBlue.withOpacity(0.3)
                    ),
                  ),
                );
              },
            ),
          ),
                                  
          // Bottom Text Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dots Indicator
                  SizedBox(height: 16),
                  PaginationIndicator(
                    itemCount: _onboardingImages.length,
                    currentIndex: _currentIndex,
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "Create a prototype in just a few minutes",
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      color: AppColors.greyDarkest,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    "Enjoy these pre-made components and worry only about creating the best product ever.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: AppColors.greyLight,
                      fontFamily: 'Inter',
                    ),
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