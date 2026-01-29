import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/widgets/primary_button.dart';
import 'package:ui_task_2/widgets/interest_option.dart';
import 'package:ui_task_2/constants/interests_list.dart';
import 'package:ui_task_2/widgets/animated_progress_bar.dart';
import 'package:ui_task_2/screens/home_screen.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  
  double get _currentProgress {
    if (InterestsList.interests.isEmpty) return 0.0;
    return InterestsList.selectedInterests.length / InterestsList.interests.length;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            
            CustomProgressBar(progress: _currentProgress),

            const SizedBox(height: 41),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personalise your experience",
                      style: AppTextStyles.h1.copyWith(color: AppColors.black),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Choose your interests.",
                      style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 41),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [

                      ListView.separated(
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: InterestsList.interests.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final interest = InterestsList.interests[index];

                          return InterestOption(
                            title: interest.title,
                            isSelected: interest.isSelected,
                            onTap: () {
                              setState(() {
                                interest.isSelected = !interest.isSelected;
                              });
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      PrimaryButton(
                        text: "Next",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                          print("Progress: ${(_currentProgress * 100).toStringAsFixed(1)}%");
                        },
                      ),
                      
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}