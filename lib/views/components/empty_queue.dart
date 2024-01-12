import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/task_chip.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/task_generator.dart';

class EmptyQueue extends StatefulWidget {
  final bool isFocused;

  const EmptyQueue({super.key, this.isFocused = false});

  @override
  State<EmptyQueue> createState() => _EmptyQueueState();
}

class _EmptyQueueState extends State<EmptyQueue> {
  @override
  Widget build(BuildContext context) {
    final randomTask = TaskGenerator.generateRandomTask(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth - (screenWidth * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
              Icons.task_alt_rounded,
              size: 40.0,
              color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          VerticalSpacing(16.0),
          widget.isFocused ? Column(
            children: [
              Text(AppLocalizations.of(context)!.noFocusTasks,
                  style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
              VerticalSpacing(8.0),
              Text(
                AppLocalizations.of(context)!.noFocusTasksDescription,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ) : Column(
            children: [
              Text(AppLocalizations.of(context)!.noTasks,
                  style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
              VerticalSpacing(8.0),
              Text(
                AppLocalizations.of(context)!.addTasks,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              VerticalSpacing(16.0),
              IntrinsicWidth(
                  child: TaskChip(
                      taskMap: randomTask,
                      onTaskTap: (){}
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
