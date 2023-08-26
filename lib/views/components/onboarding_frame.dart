import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/primary_button.dart';
import 'package:pocket_tasks/views/components/progress_nav.dart';

class OnboardingFrame extends StatefulWidget {
  const OnboardingFrame({super.key});

  @override
  State<OnboardingFrame> createState() => _OnboardingFrameState();
}

class _OnboardingFrameState extends State<OnboardingFrame> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double progressValue = 0.0; // Initial progress value

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increaseProgress() {
    if (progressValue < 1.0) {
      setState(() {
        progressValue += 0.1; // Increase the progress by 0.1
      });
    }
  }

  void _decreaseProgress() {
    if (progressValue > 0.0) {
      setState(() {
        progressValue -= 0.1; // Decrease the progress by 0.1
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          Expanded(
            child: ProgressNav(progressValue: progressValue,),
          ),
          PrimaryButton(
              onButtonPressed: (){
                _increaseProgress();
              }, buttonText: 'Continuar'
          )
        ],
      ),
    );
  }
}
