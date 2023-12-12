import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/goal_box.dart';
import 'package:pocket_tasks/views/components/task_goals.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/goal_box.dart';
import 'package:pocket_tasks/views/components/task_goals.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedGoals extends StatefulWidget {
  final UserData userData;
  final ValueChanged<Goal> onGoalChanged;

  GetStartedGoals({required this.onGoalChanged, required this.userData});

  @override
  _GetStartedGoalsState createState() => _GetStartedGoalsState();
}

class _GetStartedGoalsState extends State<GetStartedGoals> {
  late int selectedGoalBoxIndex;

  @override
  void initState() {
    super.initState();
    selectedGoalBoxIndex = -1;
  }

  bool isGoalSelected(int index) {
    return selectedGoalBoxIndex == index;
  }

  void handleGoalBoxTap(BuildContext context, int index) {
    setState(() {
      selectedGoalBoxIndex = index;
    });
    widget.onGoalChanged(TaskGoals.goalsList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              AppLocalizations.of(context)!.yourGoals,
              style: AppTextStyles.subheading1,
              textAlign: TextAlign.center,
          ),
          VerticalSpacing(24.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            itemCount: TaskGoals.goalsText(context).length,
            shrinkWrap: true,
            itemBuilder: (context, index) => GoalBox(
              itemIcon: TaskGoals.goalsIcon[index],
              itemName: TaskGoals.goalsText(context)[index],
              isSelected: isGoalSelected(index),
              onTap: () => handleGoalBoxTap(context, index),
            ),
          ),
        ],
      ),
    );
  }
}
