import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/phase_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/home_view.dart';

class NewDayView extends StatefulWidget {
  const NewDayView({super.key});

  @override
  State<NewDayView> createState() => _NewDayViewState();
}

class _NewDayViewState extends State<NewDayView> {
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
          : PhaseLoading(loadingText: AppLocalizations.of(context)!.resettingDay, descriptionText: AppLocalizations.of(context)!.newDay, loadingIcon: Icons.star_rounded),
    );
  }
}
