import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/get_started_goals.dart';
import 'package:pocket_tasks/views/components/get_started_methods.dart';
import 'package:pocket_tasks/views/components/get_started_name.dart';
import 'package:pocket_tasks/views/components/get_started_outro.dart';
import 'package:pocket_tasks/views/components/primary_button.dart';
import 'package:pocket_tasks/views/components/progress_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/onboarding-view.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class OnboardingFrame extends StatefulWidget {
  const OnboardingFrame({super.key});

  @override
  State<OnboardingFrame> createState() => _OnboardingFrameState();
}

class _OnboardingFrameState extends State<OnboardingFrame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double progressValue = 0.0; // Initial progress value
  late int currentStep = 0;

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
    final List<Widget> getStartedSteps = [
      const GetStartedName(),
      const GetStartedGoals(),
      const GetStartedMethods()
    ];

    void _updateNextStep() {
      setState(() {
        if (currentStep < getStartedSteps.length - 1) {
          currentStep++;
        } else {
          Navigator.of(context).push(CustomPageRoute(GetStartedOutro()));
        }
      });
    }

    void _updatePreviousStep() {
      setState(() {
        if (currentStep > 0) {
          currentStep--;
          getStartedSteps[currentStep];
        } else {
          Navigator.of(context).push(CustomPageRoute(const OnboardingView()));
        }
      });
    }

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          Container(
            height: 60,
            width: screenWidth,
            child: ProgressNav(
                progressValue: progressValue,
                onBackPressed: _updatePreviousStep),
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              child: Center(
                child: getStartedSteps[currentStep],
              ),
            ),
          ),
          PrimaryButton(
            onButtonPressed: () {
              _increaseProgress();
              _updateNextStep();
            },
            buttonText: AppLocalizations.of(context)!.continueNext,
          )
        ],
      ),
    );
  }
}
