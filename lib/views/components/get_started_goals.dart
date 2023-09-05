import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/goal_box.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedGoals extends StatefulWidget {
  const GetStartedGoals({super.key});

  @override
  State<GetStartedGoals> createState() => _GetStartedGoalsState();
}

class _GetStartedGoalsState extends State<GetStartedGoals> {
  int selectedGoalBoxIndex = -1; // Initially, no GoalBox is selected

  void handleGoalBoxTap(int index) {
    setState(() {
      selectedGoalBoxIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.yourGoals,
                style: AppTextStyles.regular),
            VerticalSpacing(24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoalBox(
                    itemIcon: Icons.bolt_rounded,
                    itemName: AppLocalizations.of(context)!.reachProductivity,
                    isSelected: selectedGoalBoxIndex == 0,
                    onTap: () => handleGoalBoxTap(0),
                ),
                HorizontalSpacing(16.0),
                GoalBox(
                    itemIcon: Icons.flag_rounded,
                    itemName: AppLocalizations.of(context)!.reachGoal,
                    isSelected: selectedGoalBoxIndex == 1,
                    onTap: () => handleGoalBoxTap(1),
                ),
              ],
            ),
            VerticalSpacing(16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoalBox(
                    itemIcon: Icons.fitness_center_rounded,
                    itemName: AppLocalizations.of(context)!.reachDetermination,
                    isSelected: selectedGoalBoxIndex == 2,
                    onTap: () => handleGoalBoxTap(2),
                ),
                HorizontalSpacing(16.0),
                GoalBox(
                    itemIcon: Icons.alarm_on_rounded,
                    itemName: AppLocalizations.of(context)!.reachTime,
                    isSelected: selectedGoalBoxIndex == 3,
                    onTap: () => handleGoalBoxTap(3),
                ),
              ],
            )
          ]),
    );
    ;
  }
}
