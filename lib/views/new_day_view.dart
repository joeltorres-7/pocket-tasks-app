import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/phase_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/home_view.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class NewDayView extends StatefulWidget {
  const NewDayView({super.key});

  @override
  State<NewDayView> createState() => _NewDayViewState();
}

class _NewDayViewState extends State<NewDayView> {
  bool userDataProcessed = false;

  void _deleteUserTasks() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.deleteAllTasks();
    } catch (err) {
      log("Error while deleting tasks: $err");
    }
  }

  @override
  void initState() {
    super.initState();
    _deleteUserTasks();
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
          : PhaseLoading(
          loadingText: AppLocalizations.of(context)!.resettingDay,
          descriptionText: AppLocalizations.of(context)!.newDay,
          loadingIcon: Icon(
            Icons.sunny,
            size: 40.0,
            color: AppColors.primaryYellow,
          )
      ),
    );
  }
}
