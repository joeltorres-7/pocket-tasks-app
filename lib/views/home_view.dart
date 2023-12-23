import 'package:flutter/material.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/views/add_task_view.dart';
import 'package:pocket_tasks/views/components/task_tabs.dart';
import 'package:pocket_tasks/views/new_day_view.dart';
import 'package:pocket_tasks/views/settings_view.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/utils/custom-page-route.dart';
import 'package:pocket_tasks/views/utils/custom_modal_widget.dart';
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

  @override
  void initState() {
    userName = '';
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      userGoal = Goal.values[prefs.getInt('userGoal') ?? Goal.productivity.index]; // Use default value if not found
      preferredMethod = PreferredMethod.values[prefs.getInt('preferredMethod') ?? PreferredMethod.traditional.index]; // Use default value if not found
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
                          style: AppTextStyles.heading1,
                          textAlign: TextAlign.start),
                    ),
                    Text('${AppLocalizations.of(context)!.readyDay}',
                        style: AppTextStyles.regular,
                        textAlign: TextAlign.start),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomPageRoute(const SettingsView()));
                  },
                  icon: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CustomModalWidget(
                        title: AppLocalizations.of(context)!.newDawn,
                        subtitle: AppLocalizations.of(context)!.notFeelingAsExpected,
                        buttonText: AppLocalizations.of(context)!.resetDay,
                        onClose: () {
                          Navigator.of(context).pop(); // Close the modal.
                        },
                        onButtonPressed: () {
                          Navigator.of(context).push(CustomPageRoute(const NewDayView()));
                        },
                      ),
                    );
                  },
                );
              },
              backgroundColor: AppColors.secondaryGray,
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.query_builder, color: Colors.black),
            ),
            VerticalSpacing(12.0),
            FloatingActionButton(
              heroTag: 'addTaskButton',
              onPressed: () {
                Navigator.of(context).push(CustomPageRoute(AddTaskView(onTaskAdded: _loadUserData)));
              },
              backgroundColor: AppColors.secondaryGray,
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
