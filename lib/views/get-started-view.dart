import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

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
      body: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showInitialMessage
                ? OnboardingIntro()
                : OnboardingFrame()
          ),
        ),
      ),
    );
  }
}

class OnboardingIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.letGetStarted,
      style: AppTextStyles.heading1,
    );
  }
}

class OnboardingOutro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star_rounded, size: 40.0),
        VerticalSpacing(12.0),
        Text(
          AppLocalizations.of(context)!.gettingReady,
          style: AppTextStyles.heading1,
        ),
      ],
    );
  }
}
