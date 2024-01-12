import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/empty_queue.dart';
import 'package:pocket_tasks/views/components/tasks_queue.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class ArchiveView extends StatefulWidget {
  final VoidCallback onTaskUpdated;
  const ArchiveView({Key? key, required this.onTaskUpdated}) : super(key: key);

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  List<Map<String, dynamic>> tasks = [];
  List<Map<String, dynamic>> archivedTasks = [];
  bool taskLoaded = false;

  Widget _buildMyInboxContent() {
    if (taskLoaded && archivedTasks.isNotEmpty) {
      return TasksQueue(
          queue: archivedTasks,
          showArchive: false,
          isArchiveCard: true,
          onTaskUpdated: () {
            widget.onTaskUpdated();
            setState(() {
              _initialize();
            });
          }
      );
    } else {
      return const EmptyQueue();
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    await _loadTasks();
  }

  Future<void> _loadTasks() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    tasks = await dbHelper.getTasks();
    setState(() {
      taskLoaded = true;
      _getArchivedTasks();
    });
  }

  void _getArchivedTasks() {
    archivedTasks.clear();

    for (int i = 0; i < tasks.length; i++) {
      if (tasks.elementAt(i)["isArchived"] == 1) {
        archivedTasks.add(tasks.elementAt(i));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey[100]!,
          backgroundColor: Theme.of(context).colorScheme.background,
          scrolledUnderElevation: 0.4,
          title: Text(
            AppLocalizations.of(context)!.archive,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              enableFeedback: false,
              onPressed: () {
                AudioManager.playFromName('back.wav');
                widget.onTaskUpdated();
                Navigator.of(context).pop();
              }
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.delete_forever_rounded, color: Theme.of(context).colorScheme.primary),
                  padding: const EdgeInsets.all(12.0),
                  splashColor: const Color(0xFFFEF3F5),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    print('Deleted archive.');
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 24.0, bottom: 8.0, right: 24.0),
                  child: SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.archivedTasks,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                        ),
                        VerticalSpacing(8.0),
                        Text(
                          AppLocalizations.of(context)!.archivedTasksDescription,
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.left,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 32.0, left: 24.0, right: 24.0),
                    child: _buildMyInboxContent(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
