import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/onboarding_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/get-started-view.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentView = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _updateNextView() {
      setState(() {
        if (currentView < 3) {
          currentView++;
        } else {
          Navigator.of(context).push(CustomPageRoute(GetStartedView()));
        }
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.black54,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24.0,
                    )),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: OnboardingCard(
                  currentIndex: currentView,
                  items: [
                    {'title': AppLocalizations.of(context)!.onboardTitle1, 'subtitle': AppLocalizations.of(context)!.onboardSubtitle1},
                    {'title': AppLocalizations.of(context)!.onboardTitle2, 'subtitle': AppLocalizations.of(context)!.onboardSubtitle2},
                    {'title': AppLocalizations.of(context)!.onboardTitle3, 'subtitle': AppLocalizations.of(context)!.onboardSubtitle3},
                    {'title': AppLocalizations.of(context)!.onboardTitle4, 'subtitle': AppLocalizations.of(context)!.onboardSubtitle4}
                  ],
                  onNextPressed: _updateNextView,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
