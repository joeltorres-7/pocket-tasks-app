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
import 'package:pocket_tasks/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingFrame extends StatefulWidget {
  @override
  State<OnboardingFrame> createState() => _OnboardingFrameState();
}

class _OnboardingFrameState extends State<OnboardingFrame> {
  late int currentStep;
  late UserData userData;

  @override
  void initState() {
    super.initState();
    currentStep = 0;
    userData = UserData(userName: '');
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

  void _nextStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    } else {
      // Save data and navigate to the next screen
      _saveUserData();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingOutro(),
      ));
    }
  }

  void _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userData.userName);
    prefs.setInt('userGoal', userData.userGoal.index); // Fix this line
    prefs.setInt('preferredMethod', userData.preferredMethod.index); // Fix this line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCurrentStep(),
          ),
          PrimaryButton(
            onButtonPressed: _nextStep,
            buttonText: AppLocalizations.of(context)!.continueNext,
          ),
        ],
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
