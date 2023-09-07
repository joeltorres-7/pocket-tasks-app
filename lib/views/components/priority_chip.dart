import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriorityChip extends StatelessWidget {
  final bool highPriority;
  final bool mediumPriority;
  final bool lowPriority;

  const PriorityChip({super.key, this.highPriority = false, this.mediumPriority = false, this.lowPriority = false});

  @override
  Widget build(BuildContext context) {
    Widget priorityText;
    Color priorityColor;

    if (highPriority) {
      priorityText = Text(AppLocalizations.of(context)!.highPriority);
      priorityColor = AppColors.primaryRed;
    } else if (mediumPriority) {
      priorityText = Text(AppLocalizations.of(context)!.mediumPriority);
      priorityColor = AppColors.primaryBlue;
    } else {
      priorityText = Text(AppLocalizations.of(context)!.lowPriority);
      priorityColor = AppColors.primaryGray;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: priorityColor,
      ),
      child: priorityText,
    );
  }
}
