import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';

class TaskGoals {
  static List<Goal> goalsList = [
    Goal.productivity,
    Goal.achievement,
    Goal.determination,
    Goal.freeTime,
  ];

  static List<String> goalsText(BuildContext context) => [
    AppLocalizations.of(context)!.reachProductivity,
    AppLocalizations.of(context)!.reachGoal,
    AppLocalizations.of(context)!.reachDetermination,
    AppLocalizations.of(context)!.reachTime,
  ];

  static List<IconData> goalsIcon = [
    Icons.bolt_rounded,
    Icons.flag_rounded,
    Icons.psychology_rounded,
    Icons.alarm_on_rounded,
  ];
}