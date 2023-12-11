import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/empty_queue.dart';
import 'package:pocket_tasks/views/components/tasks_queue.dart';

class TaskQueuePanel extends StatefulWidget {
  final List tasksOnQueue;
  const TaskQueuePanel({super.key, required this.tasksOnQueue});

  @override
  State<TaskQueuePanel> createState() => _TaskQueuePanelState();
}

class _TaskQueuePanelState extends State<TaskQueuePanel> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          child: widget.tasksOnQueue.isEmpty
              ? TasksQueue(queue: widget.tasksOnQueue)
              : const EmptyQueue(),
        )
    );
  }
}
