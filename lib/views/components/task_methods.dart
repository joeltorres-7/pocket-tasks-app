import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';

class TaskMethods {
  static List<PreferredMethod> methodsList = [
    PreferredMethod.traditional,
    PreferredMethod.labels,
    PreferredMethod.priorities,
    PreferredMethod.projects,
    PreferredMethod.timer,
  ];

  static List<String> methodsText(BuildContext context) => [
    AppLocalizations.of(context)!.methodTraditional,
    AppLocalizations.of(context)!.methodLabels,
    AppLocalizations.of(context)!.methodPriorities,
    AppLocalizations.of(context)!.methodProjects,
    AppLocalizations.of(context)!.methodTimer,
  ];

  static List<String> methodsDescription(BuildContext context) => [
    AppLocalizations.of(context)!.methodTraditionalDescription,
    AppLocalizations.of(context)!.methodLabelsDescription,
    AppLocalizations.of(context)!.methodPrioritiesDescription,
    AppLocalizations.of(context)!.methodProjectsDescription,
    AppLocalizations.of(context)!.methodTimerDescription,
  ];

  static List<IconData> methodsIcon = [
    Icons.bolt_rounded,
    Icons.label_rounded,
    Icons.label_important_rounded,
    Icons.interests_rounded,
    Icons.timer_rounded,
  ];
}