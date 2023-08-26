import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/onboarding_frame.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  bool showInitialMessage = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        showInitialMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: showInitialMessage
              ? OnboardingIntro()
              : OnboardingFrame()
        ),
      ),
    );
  }
}

class OnboardingIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Let's set your experience :)",
      style: TextStyle(fontSize: 20),
    );
  }
}
