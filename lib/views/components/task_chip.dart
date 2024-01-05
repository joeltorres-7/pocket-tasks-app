import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class TaskChip extends StatefulWidget {
  final String taskName;
  final VoidCallback onTaskTap;

  const TaskChip({super.key, required this.taskName, required this.onTaskTap});

  @override
  State<TaskChip> createState() => _TaskChipState();
}

class _TaskChipState extends State<TaskChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTaskTap,
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
              Text(widget.taskName, style: Theme.of(context).textTheme.bodyMedium),
              HorizontalSpacing(4.0),
              Icon(Icons.add, size: 18.0, color: Theme.of(context).colorScheme.inversePrimary)
            ],
          ),
        ),
      ),
    );
  }
}
