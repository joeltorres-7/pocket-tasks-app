import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/priority_chip.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  const TaskCard({super.key, required this.title, required this.description});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(

        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(widget.title, style: AppTextStyles.heading1),
                Text(widget.description, style: AppTextStyles.subheading1
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriorityChip(),
                Icon(Icons.arrow_forward, size: 16.0, color: Colors.black38)
              ],
            )
          ],
        ),
      ),
    );
  }
}
