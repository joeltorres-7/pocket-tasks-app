import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/onboarding-view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedOutro extends StatefulWidget {
  const GetStartedOutro({super.key});

  @override
  State<GetStartedOutro> createState() => _GetStartedOutroState();
}

class _GetStartedOutroState extends State<GetStartedOutro> {
  bool showInitialMessage = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 500), () {
      setState(() {
        showInitialMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 8000),
              child: showInitialMessage
                  ? OnboardingOutro()
                  : OnboardingView()
          ),
        ),
      ),
    );
  }
}

class OnboardingOutro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.star_rounded, size: 40.0),
            VerticalSpacing(12.0),
            SizedBox(
              width: screenWidth - (screenWidth * 0.4),
              child: Text(
                AppLocalizations.of(context)!.gettingReady,
                style: AppTextStyles.heading1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
