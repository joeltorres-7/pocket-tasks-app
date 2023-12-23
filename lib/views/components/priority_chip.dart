import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriorityChip extends StatelessWidget {
  final String priorityLevel;

  const PriorityChip({super.key, required this.priorityLevel});

  @override
  Widget build(BuildContext context) {
    Widget priorityText;
    Color priorityColor;

    if (priorityLevel == "high") {
      priorityText = Text(AppLocalizations.of(context)!.highPriority, style: const TextStyle(color: Colors.white, fontSize: 12.0));
      priorityColor = AppColors.primaryRed;
    } else if (priorityLevel == "medium") {
      priorityText = Text(AppLocalizations.of(context)!.mediumPriority, style: const TextStyle(color: Colors.white, fontSize: 12.0));
      priorityColor = AppColors.primaryBlue;
    } else {
      priorityText = Text(AppLocalizations.of(context)!.lowPriority, style: const TextStyle(color: Colors.white, fontSize: 12.0));
      priorityColor = AppColors.primaryGray;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: priorityColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: priorityText,
      ),
    );
  }
}
