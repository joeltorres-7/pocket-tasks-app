import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/task_card.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class TasksQueue extends StatefulWidget {
  final List<Map<String, dynamic>> queue;
  final bool focus;

  const TasksQueue({super.key, required this.queue, this.focus = false});

  @override
  State<TasksQueue> createState() => _TasksOnQueueState();
}

class _TasksOnQueueState extends State<TasksQueue> {
  final List<Map<String, dynamic>> focusTaskList = [];

  @override
  void initState() {
    super.initState();
    _getHighPriority();
  }

  void _getHighPriority() {
    for (int i = 0; i < widget.queue.length; i++) {
      if (widget.queue.elementAt(i)["priority"] == "high") {
        focusTaskList.add(widget.queue.elementAt(i));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> taskList = widget.queue;

    return Column(
      children: [
        VerticalSpacing(16.0),
        Expanded(
          child: widget.focus ? ListView.builder(
            itemCount: focusTaskList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TaskCard(
                  title: focusTaskList.elementAt(index)["title"],
                  hasDescription: focusTaskList.elementAt(index)["description"].isNotEmpty,
                  description: focusTaskList.elementAt(index)["description"],
                  priority: focusTaskList.elementAt(index)["priority"],
                ),
              );
          }) : ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TaskCard(
                    title: taskList.elementAt(index)["title"],
                    hasDescription: taskList.elementAt(index)["description"].isNotEmpty,
                    description: taskList.elementAt(index)["description"],
                    priority: taskList.elementAt(index)["priority"],
                  ),
                );
              }),
        ),
      ],
    );
  }
}