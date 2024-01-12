import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/archive_card.dart';
import 'package:pocket_tasks/views/components/task_card.dart';
import 'package:pocket_tasks/views/edit_task_view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class TasksQueue extends StatefulWidget {
  final List<Map<String, dynamic>> queue;
  final bool showArchive;
  final bool isArchiveCard;
  final VoidCallback onTaskUpdated;

  const TasksQueue({super.key, required this.queue, required this.onTaskUpdated, this.showArchive = true, this.isArchiveCard = false});

  @override
  State<TasksQueue> createState() => _TasksOnQueueState();
}

class _TasksOnQueueState extends State<TasksQueue> {
  final List<Map<String, dynamic>> focusTaskList = [];

  @override
  void initState() {
    super.initState();
  }

  bool _getArchivedCondition(List<Map<String, dynamic>> list, int index) {
    bool archivedCondition = false;

    if (widget.isArchiveCard) {
      archivedCondition = list.elementAt(index)["isArchived"] == 1;
    } else {
      archivedCondition =  list.elementAt(index)["isArchived"] == 0;
    }

    return archivedCondition;
  }

  Future<void> _unarchiveTask(int index, int archivedStatus) async {
    DatabaseHelper dbHelper = DatabaseHelper();
    bool taskArchiveStatus = (archivedStatus == 0);

    try {
      await dbHelper.toggleTaskArchived(index, taskArchiveStatus);
      widget.onTaskUpdated();
    } catch (err) {
      log("Error while deleting task: $err");
    }
  }

  void _updateTaskStatus(int index, int status) async {
    DatabaseHelper dbHelper = DatabaseHelper();
    bool taskStatus = (status == 0);

    try {
      await dbHelper.toggleTaskCompletion(index, taskStatus);
      widget.onTaskUpdated();
    } catch (err) {
      log("Error while deleting task: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> taskList = widget.queue;

    return Column(
      children: [
        VerticalSpacing(16.0),
        widget.showArchive ? Column(
          children: [
            ArchiveCard(
                onTaskUpdated: () {
                  widget.onTaskUpdated();
                },
            ),
            VerticalSpacing(12.0),
          ],
        ) : const SizedBox(),
        AnimatedContainer(
          key: const Key('tasksContainer'),
          duration: const Duration(milliseconds: 300),
          child: Expanded(
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  bool archivedCondition = _getArchivedCondition(taskList, index);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: archivedCondition ? TaskCard(
                      title: taskList.elementAt(index)["title"],
                      hasDescription: taskList.elementAt(index)["description"].isNotEmpty,
                      description: taskList.elementAt(index)["description"],
                      priority: taskList.elementAt(index)["priority"],
                      isCompleted: taskList.elementAt(index)["isCompleted"],
                      isArchiveCard: widget.isArchiveCard,
                      onChecked: () {
                        _updateTaskStatus(
                            taskList.elementAt(index)["id"],
                            taskList.elementAt(index)["isCompleted"]
                        );
                      },
                      onCardTap: () {
                        Navigator.of(context).push(CustomPageRoute(EditTaskView(
                            onTaskUpdated: () {
                              widget.onTaskUpdated();
                            },
                            taskIndex: taskList.elementAt(index)["id"],
                            taskMap: taskList.elementAt(index)
                        )));
                      },
                      onTaskRefreshed: (){
                        _unarchiveTask(
                            taskList.elementAt(index)["id"],
                            taskList.elementAt(index)["isArchived"]
                        );
                        AudioManager.playFromName('completed.wav');
                      }
                    ) : const SizedBox(),
                  );
                }),
          ),
        ),
      ],
    );
  }
}