import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskGenerator {
  static final Random _random = Random();

  static Map<String, String> generateRandomTask(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.taskTitle1,
      AppLocalizations.of(context)!.taskTitle2,
      AppLocalizations.of(context)!.taskTitle3,
      AppLocalizations.of(context)!.taskTitle4,
      AppLocalizations.of(context)!.taskTitle5,
      AppLocalizations.of(context)!.taskTitle6,
      AppLocalizations.of(context)!.taskTitle7,
      AppLocalizations.of(context)!.taskTitle8,
      AppLocalizations.of(context)!.taskTitle9,
      AppLocalizations.of(context)!.taskTitle10,
      AppLocalizations.of(context)!.taskTitle11,
      AppLocalizations.of(context)!.taskTitle12,
      AppLocalizations.of(context)!.taskTitle13,
      AppLocalizations.of(context)!.taskTitle14,
      AppLocalizations.of(context)!.taskTitle15,
      AppLocalizations.of(context)!.taskTitle16,
      AppLocalizations.of(context)!.taskTitle17,
      AppLocalizations.of(context)!.taskTitle18,
      AppLocalizations.of(context)!.taskTitle19,
      AppLocalizations.of(context)!.taskTitle20,
      AppLocalizations.of(context)!.taskTitle21,
      AppLocalizations.of(context)!.taskTitle22,
      AppLocalizations.of(context)!.taskTitle23,
      AppLocalizations.of(context)!.taskTitle24,
      AppLocalizations.of(context)!.taskTitle25,
      AppLocalizations.of(context)!.taskTitle26,
      AppLocalizations.of(context)!.taskTitle27,
      AppLocalizations.of(context)!.taskTitle28,
      AppLocalizations.of(context)!.taskTitle29,
      AppLocalizations.of(context)!.taskTitle30,
    ];

    final descriptions = [
      AppLocalizations.of(context)!.taskDescription1,
      AppLocalizations.of(context)!.taskDescription2,
      AppLocalizations.of(context)!.taskDescription3,
      AppLocalizations.of(context)!.taskDescription4,
      AppLocalizations.of(context)!.taskDescription5,
      AppLocalizations.of(context)!.taskDescription6,
      AppLocalizations.of(context)!.taskDescription7,
      AppLocalizations.of(context)!.taskDescription8,
      AppLocalizations.of(context)!.taskDescription9,
      AppLocalizations.of(context)!.taskDescription10,
      AppLocalizations.of(context)!.taskDescription11,
      AppLocalizations.of(context)!.taskDescription12,
      AppLocalizations.of(context)!.taskDescription13,
      AppLocalizations.of(context)!.taskDescription14,
      AppLocalizations.of(context)!.taskDescription15,
      AppLocalizations.of(context)!.taskDescription16,
      AppLocalizations.of(context)!.taskDescription17,
      AppLocalizations.of(context)!.taskDescription18,
      AppLocalizations.of(context)!.taskDescription19,
      AppLocalizations.of(context)!.taskDescription20,
      AppLocalizations.of(context)!.taskDescription21,
      AppLocalizations.of(context)!.taskDescription22,
      AppLocalizations.of(context)!.taskDescription23,
      AppLocalizations.of(context)!.taskDescription24,
      AppLocalizations.of(context)!.taskDescription25,
      AppLocalizations.of(context)!.taskDescription26,
      AppLocalizations.of(context)!.taskDescription27,
      AppLocalizations.of(context)!.taskDescription28,
      AppLocalizations.of(context)!.taskDescription29,
      AppLocalizations.of(context)!.taskDescription30,
    ];

    // Generate a random index for both titles and descriptions
    final randomIndex = _random.nextInt(titles.length);

    // Create a map with the selected title and description
    final taskMap = {
      'title': titles[randomIndex],
      'description': descriptions[randomIndex],
    };

    return taskMap;
  }
}