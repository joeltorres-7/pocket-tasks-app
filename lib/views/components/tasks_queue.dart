import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/task_card.dart';
import 'package:pocket_tasks/views/edit-task-view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class TasksQueue extends StatefulWidget {
  final List<Map<String, dynamic>> queue;
  final VoidCallback onTaskUpdated;

  const TasksQueue(
      {super.key, required this.queue, required this.onTaskUpdated});

  @override
  State<TasksQueue> createState() => _TasksOnQueueState();
}

class _TasksOnQueueState extends State<TasksQueue> {
  final List<Map<String, dynamic>> focusTaskList = [];

  @override
  void initState() {
    super.initState();
  }

  void _updateTaskStatus(int index, int status) async {
    DatabaseHelper dbHelper = DatabaseHelper();
    bool taskStatus = (status == 0);

    try {
      await dbHelper.toggleTaskCompletion(index, taskStatus);
      widget.onTaskUpdated();
    } catch (err) {
      log("Error while deleting task: ${err}");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> taskList = widget.queue;

    return Column(
      children: [
        VerticalSpacing(16.0),
        Expanded(
          child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TaskCard(
                    title: taskList.elementAt(index)["title"],
                    hasDescription:
                        taskList.elementAt(index)["description"].isNotEmpty,
                    description: taskList.elementAt(index)["description"],
                    priority: taskList.elementAt(index)["priority"],
                    isCompleted: taskList.elementAt(index)["isCompleted"],
                    onChecked: () {
                      _updateTaskStatus(taskList.elementAt(index)["id"],
                          taskList.elementAt(index)["isCompleted"]);
                    },
                    onCardTap: () {
                      Navigator.of(context).push(CustomPageRoute(EditTaskView(
                          onTaskUpdated: () {
                            widget.onTaskUpdated();
                          },
                          taskIndex: taskList.elementAt(index)["id"],
                          taskMap: taskList.elementAt(index))));
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
