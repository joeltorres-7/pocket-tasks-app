import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/empty_queue.dart';
import 'package:pocket_tasks/views/components/tasks_queue.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';

class TaskTabs extends StatefulWidget {
  final VoidCallback onTaskUpdated;
  TaskTabs({super.key, required this.onTaskUpdated});

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<TaskTabs> {
  List<Map<String, dynamic>> tasks = [];
  bool taskLoaded = false;
  int _selectedTabIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

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
    });
    widget.onTaskUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabs: [AppLocalizations.of(context)!.myInbox, AppLocalizations.of(context)!.todayFocus],
          selectedIndex: _selectedTabIndex,
          onTabTapped: _onTabTapped,
        ),
        Expanded(
          child: _selectedTabIndex == 0
              ? _buildMyInboxContent()
              : _buildTodaysFocusContent(),
        ),
      ],
    );
  }

  Widget _buildMyInboxContent() {
    if (taskLoaded && tasks.isNotEmpty) {
      return TasksQueue(queue: tasks, focus: false, onTaskDeleted: widget.onTaskUpdated);
    } else {
      return const EmptyQueue();
    }
  }

  Widget _buildTodaysFocusContent() {
    if (taskLoaded && tasks.isNotEmpty) {
      return TasksQueue(queue: tasks, focus: true, onTaskDeleted: widget.onTaskUpdated);
    } else {
      return const EmptyQueue();
    }
  }

  @override
  void didUpdateWidget(covariant TaskTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onTaskUpdated != widget.onTaskUpdated) {
      _loadTasks();
      widget.onTaskUpdated();
    }
  }
}