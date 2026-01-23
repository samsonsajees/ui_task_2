import 'package:flutter/material.dart';

class TestUi extends StatefulWidget {
  const TestUi({super.key});

  @override
  State<TestUi> createState() => _TestUiState();
}

class _TestUiState extends State<TestUi> {
  final ValueNotifier<double> progress = ValueNotifier<double>(0.0);
  bool isAnimating = false;


  @override
  void dispose() {
    progress.dispose();
    super.dispose();
  }

  Future<void> fillToFull() async {
    if (isAnimating) return; 
    isAnimating = true;

    while (progress.value < 1.0) {
      
      progress.value = (progress.value + 0.05).clamp(0.0, 1.0);
      await Future.delayed(const Duration(milliseconds: 500));
      print(  "Progress: ${(progress.value * 100).toStringAsFixed(1)}%");
    }
    
    isAnimating = false;
  }

  Future<void> emptyToZero() async {
    if (isAnimating) return;
    isAnimating = true;

    while (progress.value > 0.0) {
      
      progress.value = (progress.value - 0.05).clamp(0.0, 1.0);
      await Future.delayed(const Duration(milliseconds: 500));
      print(  "Progress: ${(progress.value * 100).toStringAsFixed(1)}%");
    }

    isAnimating = false;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              height: 812,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  ValueListenableBuilder<double>(
                    valueListenable: progress,
                    builder: (context, value, child) {
                      return MyWidgetState(
                        progress: value, 
                      );
                    },
                  ),
                  
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => fillToFull(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.add, color: Colors.black),
                        ),
                      ),
            
                      const SizedBox(width: 50),
            
                      GestureDetector(
                        onTap: () => emptyToZero(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.remove, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}



class MyWidgetState extends StatelessWidget {

  final double progress;
  const MyWidgetState({required this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child :LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                height: 12,
                                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
                              );
                            }
                          ),
                          AnimatedContainer(
                            alignment: Alignment.topLeft,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            width: constraints.maxWidth * progress.clamp(0,1),
                            height: 12,
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
                          ),
                        ],
                      );
        }
      ),
    );
  }
}