import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/goal_box.dart';
import 'package:pocket_tasks/views/components/task_goals.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedGoals extends StatelessWidget {
  final UserData userData;
  final ValueChanged<Goal> onGoalChanged;

  GetStartedGoals({required this.onGoalChanged, required this.userData});

  int selectedGoalBoxIndex = -1;

  bool isGoalSelected(int index) {
    return selectedGoalBoxIndex == index;
  }

  void handleGoalBoxTap(BuildContext context, int index) {
    selectedGoalBoxIndex = index;
    onGoalChanged(TaskGoals.goalsList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.yourGoals, style: AppTextStyles.regular),
          VerticalSpacing(24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < TaskGoals.goalsText(context).length; i++)
                GoalBox(
                  itemIcon: TaskGoals.goalsIcon[i],
                  itemName: TaskGoals.goalsText(context)[i],
                  isSelected: isGoalSelected(i),
                  onTap: () => handleGoalBoxTap(context, i),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
