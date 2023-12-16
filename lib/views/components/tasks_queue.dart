import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/task_card.dart';
import 'package:pocket_tasks/views/edit-task-view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';

class TasksQueue extends StatefulWidget {
  final List<Map<String, dynamic>> queue;
  final VoidCallback onTaskUpdated;

  const TasksQueue({super.key, required this.queue, required this.onTaskUpdated});

  @override
  State<TasksQueue> createState() => _TasksOnQueueState();
}

class _TasksOnQueueState extends State<TasksQueue> {
  final List<Map<String, dynamic>> focusTaskList = [];

  @override
  void initState() {
    super.initState();
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
                    hasDescription: taskList.elementAt(index)["description"].isNotEmpty,
                    description: taskList.elementAt(index)["description"],
                    priority: taskList.elementAt(index)["priority"],
                    onCardTap: () {
                      Navigator.of(context).push(CustomPageRoute(EditTaskView(
                          onTaskUpdated: () {
                            widget.onTaskUpdated();
                          },
                          taskIndex: taskList.elementAt(index)["id"],
                          taskMap: taskList.elementAt(index)
                      )));
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}