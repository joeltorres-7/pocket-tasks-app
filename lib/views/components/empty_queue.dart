import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/task_chip.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyQueue extends StatefulWidget {
  const EmptyQueue({super.key});

  @override
  State<EmptyQueue> createState() => _EmptyQueueState();
}

class _EmptyQueueState extends State<EmptyQueue> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth - (screenWidth * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.task_alt_rounded,
              size: 40.0, color: AppColors.primaryGray),
          VerticalSpacing(16.0),
          Text(AppLocalizations.of(context)!.noTasks,
              style: AppTextStyles.heading1, textAlign: TextAlign.center),
          Text(
            AppLocalizations.of(context)!.addTasks,
            style: AppTextStyles.subheading1,
            textAlign: TextAlign.center,
          ),
          VerticalSpacing(16.0),
          IntrinsicWidth(
              child: TaskChip(
                  taskName: 'Leer un libro por 30 minutos',
                  onTaskTap: (){}
              )
          )
        ],
      ),
    );
  }
}
