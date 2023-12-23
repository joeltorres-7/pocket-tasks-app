import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

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
          border: Border.all(width: 1.0, color: AppColors.tertiaryGray)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.taskName, style: AppTextStyles.regularMedium14),
              HorizontalSpacing(4.0),
              const Icon(Icons.add, size: 18.0, color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
