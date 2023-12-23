import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/phase_loading.dart';
import 'package:pocket_tasks/views/home_view.dart';

class OnboardingOutro extends StatefulWidget {
  const OnboardingOutro({super.key});

  @override
  State<OnboardingOutro> createState() => _OnboardingOutroState();
}

class _OnboardingOutroState extends State<OnboardingOutro> {
  bool userDataProcessed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        userDataProcessed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: userDataProcessed
          ? const HomeView()
          : PhaseLoading(loadingText: AppLocalizations.of(context)!.gettingReady, loadingIcon: const Icon(Icons.star_rounded, size: 40.0)),
    );
  }
}