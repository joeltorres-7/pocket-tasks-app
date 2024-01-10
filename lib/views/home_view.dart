import 'package:flutter/material.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/views/add_task_view.dart';
import 'package:pocket_tasks/views/components/task_tabs.dart';
import 'package:pocket_tasks/views/new_day_view.dart';
import 'package:pocket_tasks/views/settings_view.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';
import 'package:pocket_tasks/views/utils/custom_modal_widget.dart';
import 'package:pocket_tasks/views/utils/database_manager.dart';
import 'package:pocket_tasks/views/utils/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late String? userName;
  late Goal userGoal;
  late PreferredMethod preferredMethod;
  int activeTasks = 0;
  bool enableTaskReminders = false;

  @override
  void initState() {
    userName = '';
    super.initState();
    _loadUserData();
    _initializeNotifications();
    AudioManager.init();
  }

  Future<void> getNotificationPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enableTaskReminders = prefs.getBool('enableTaskReminders') ?? false;
  }

  Future<void> getTaskNumber() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> taskList = await dbHelper.getTasks();
    activeTasks = taskList.length;
  }

  Future<void> _initializeNotifications() async {
    await getNotificationPreferences();
    await getTaskNumber();
    await LocalNotificationService().scheduleDailyNotifications(activeTasks, enableTaskReminders, context);
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      userGoal = Goal.values[prefs.getInt('userGoal') ?? Goal.productivity.index];
      preferredMethod = PreferredMethod.values[prefs.getInt('preferredMethod') ?? PreferredMethod.traditional.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 24.0, right: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                          '${AppLocalizations.of(context)!.myInbox}, ${userName ?? AppLocalizations.of(context)!.guestTitle}!',
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.start),
                    ),
                    Text(
                        AppLocalizations.of(context)!.readyDay,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.start),
                  ],
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    AudioManager.playFromName('tap.wav');
                    Navigator.of(context).push(CustomPageRoute(const SettingsView()));
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpacing(24.0),
            Expanded(child: TaskTabs(
              onTaskUpdated: () {
                _loadUserData();
              },
            )),
          ],
        ),
      ),
          )
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'resetDayButton',
              enableFeedback: false,
              onPressed: () {
                AudioManager.playFromName('tap.wav');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CustomModalWidget(
                        title: AppLocalizations.of(context)!.newDawn,
                        subtitle: AppLocalizations.of(context)!.notFeelingAsExpected,
                        buttonText: AppLocalizations.of(context)!.resetDay,
                        onClose: () {
                          AudioManager.playFromName('tap.wav');
                          Navigator.of(context).pop();
                        },
                        onButtonPressed: () {
                          Navigator.of(context).push(CustomPageRoute(const NewDayView()));
                        },
                      ),
                    );
                  },
                );
              },
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
              shape: const CircleBorder(),
              elevation: 0,
              child: Icon(Icons.query_builder, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            VerticalSpacing(12.0),
            FloatingActionButton(
              enableFeedback: false,
              heroTag: 'addTaskButton',
              onPressed: () {
                AudioManager.playFromName('tap.wav');
                Navigator.of(context).push(CustomPageRoute(AddTaskView(onTaskAdded: _loadUserData)));
              },
              backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
              shape: const CircleBorder(),
              elevation: 0,
              child: Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
    );
  }
}
