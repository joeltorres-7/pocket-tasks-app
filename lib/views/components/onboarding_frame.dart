import 'package:flutter/material.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/get_started_goals.dart';
import 'package:pocket_tasks/views/components/get_started_methods.dart';
import 'package:pocket_tasks/views/components/get_started_name.dart';
import 'package:pocket_tasks/views/components/onboarding_outro.dart';
import 'package:pocket_tasks/views/components/primary_button.dart';
import 'package:pocket_tasks/views/components/progress_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/onboarding_view.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingFrame extends StatefulWidget {
  @override
  State<OnboardingFrame> createState() => _OnboardingFrameState();
}

class _OnboardingFrameState extends State<OnboardingFrame> with SingleTickerProviderStateMixin {
  late int currentStep;
  late UserData userData;

  late AnimationController _controller;
  double progressValue = 0.0; // Initial progress value

  @override
  void initState() {
    super.initState();
    currentStep = 0;
    userData = UserData(userName: '');

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
        progressValue += (100 / 3) / 100; // Increase the progress by 0.1
      });
    }
  }

  void _decreaseProgress() {
    if (progressValue > 0.0) {
      setState(() {
        progressValue -= (100 / 3) / 100; // Decrease the progress by 0.1
      });
    }
  }

  void _updateStep(dynamic value) {
    setState(() {
      switch (currentStep) {
        case 0:
          userData.userName = value as String;
          break;
        case 1:
          userData.userGoal = value;
          break;
        case 2:
          userData.preferredMethod = value;
          break;
      }
    });
  }

  void _updatePreviousStep() {
    setState(() {
      if (currentStep > 0) {
        setState(() {
          _decreaseProgress();
          currentStep--;
        });
      } else {
        Navigator.of(context).push(CustomPageRoute(const OnboardingView()));
      }
    });
  }

  void _nextStep() {
    if (_isValidInput()) {
      if (currentStep < 2) {
        setState(() {
          _increaseProgress();
          currentStep++;
        });
      } else {
        // Save data and navigate to the next screen
        _saveUserData();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const OnboardingOutro(),
        ));
      }
    }
  }

  bool _isValidInput() {
    switch (currentStep) {
      case 0:
        return userData.userName.isNotEmpty;
      case 1:
        return userData.userGoal != Goal.unknown;
      case 2:
        return userData.preferredMethod != PreferredMethod.unknown;
      default:
        return false;
    }
  }

  void _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userData.userName);
    prefs.setInt('userGoal', userData.userGoal.index); // Fix this line
    prefs.setInt('preferredMethod', userData.preferredMethod.index); // Fix this line
  }

  bool _isContinueButtonEnabled() {
    switch(currentStep) {
      case 0:
        return userData.userName.isNotEmpty;
      case 1:
        return userData.userGoal != Goal.unknown;
      case 2:
        return userData.preferredMethod != PreferredMethod.unknown;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: screenWidth,
              child: ProgressNav(
                  progressValue: progressValue,
                  onBackPressed: _updatePreviousStep),
            ),
            Expanded(
              child: _buildCurrentStep(),
            ),
            PrimaryButton(
              onButtonPressed: _nextStep,
              buttonText: AppLocalizations.of(context)!.continueNext,
              isButtonEnabled: _isContinueButtonEnabled(), // Pass the enable/disable state
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return GetStartedName(
          userData: userData,
          onNameChanged: _updateStep,
        );
      case 1:
        return GetStartedGoals(
          userData: userData,
          onGoalChanged: _updateStep,
        );
      case 2:
        return GetStartedMethods(
          userData: userData,
          onMethodChanged: _updateStep,
        );
      default:
        return Container(); // Handle unexpected case
    }
  }
}
