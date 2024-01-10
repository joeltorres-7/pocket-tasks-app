import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class TaskChip extends StatefulWidget {
  final Map<String, dynamic> taskMap;
  final VoidCallback onTaskTap;

  const TaskChip({super.key, required this.taskMap, required this.onTaskTap});

  @override
  State<TaskChip> createState() => _TaskChipState();
}

class _TaskChipState extends State<TaskChip> {
  bool savingTask = false;

  void _saveNewTask() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    setState(() {
      savingTask = true;
    });

    try {
      await dbHelper.insertTask({
        'priority': 'medium',
        'title': widget.taskMap['title'],
        'description': widget.taskMap['description'],
      });

      AudioManager.playFromName('task_added.wav');

      deactivate();
    } catch (err) {
      log("Error while saving new task: ${err}");
    }
  }

  bool _shouldUseMarquee(String text, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.bodyMedium),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        _saveNewTask();
      },
      splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
      borderRadius: BorderRadius.circular(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(width: 1.0, color: Theme.of(context).colorScheme.outlineVariant)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.6,
                ),
                child: _shouldUseMarquee(widget.taskMap['title'], screenWidth * 0.6)
                    ? SizedBox(
                  height: 20.0,
                  width: screenWidth * 0.6,
                  child: Marquee(
                      text: widget.taskMap['title'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 16.0,
                    velocity: 18.0,
                    startPadding: 0.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                    pauseAfterRound: const Duration(seconds: 2),
                    showFadingOnlyWhenScrolling: false,
                  ),
                )
                    : Text(
                  widget.taskMap['title'],
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              HorizontalSpacing(4.0),
              Icon(Icons.add, size: 18.0, color: Theme.of(context).colorScheme.inversePrimary)
            ],
          ),
        ),
      ),
    );
  }
}
