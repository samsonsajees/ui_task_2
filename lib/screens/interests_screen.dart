import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/widgets/primary_button.dart';
import 'package:ui_task_2/widgets/interest_option.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = [
    "User Interface",
    "User Experience",
    "User Research",
    "UX Writing",
    "User Testing",
    "Service Design",
    "Strategy",
    "Design Systems"
  ];

  final Set<String> selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    double progress = interests.isNotEmpty 
        ? selectedInterests.length / interests.length 
        : 0.0;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 0, end: progress),
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value, 
                    minHeight: 8,
                    backgroundColor: const Color(0xFFF2F2F5),
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ),

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
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: AppColors.greyDarkest,
                        fontFamily: 'Inter',
                        letterSpacing: -0.5
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Choose your interests.",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.greyLight,
                        fontFamily: 'Inter',
                      ),
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
                      // The List
                      ListView.separated(
                        // Important: shrinkWrap and physics ensure it behaves inside the ScrollView
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: interests.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final interest = interests[index];
                          final isSelected = selectedInterests.contains(interest);

                          return InterestOption(
                            title: interest,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedInterests.remove(interest);
                                } else {
                                  selectedInterests.add(interest);
                                }
                              });
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // The Button
                      PrimaryButton(
                        text: "Next",
                        onPressed: () {
                           print("Progress: ${(progress * 100).toStringAsFixed(1)}%");
                        },
                      ),
                      
                      // Bottom safety padding
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