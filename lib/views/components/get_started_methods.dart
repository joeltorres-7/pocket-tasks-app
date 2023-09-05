import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/method_box.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedMethods extends StatefulWidget {
  const GetStartedMethods({super.key});

  @override
  State<GetStartedMethods> createState() => _GetStartedMethodsState();
}

class _GetStartedMethodsState extends State<GetStartedMethods> {
  int selectedGoalBoxIndex = -1; // Initially, no GoalBox is selected

  void handleMethodBoxTap(int index) {
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
            Text(AppLocalizations.of(context)!.yourMethods,
                style: AppTextStyles.regular),
            VerticalSpacing(24.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MethodBox(
                  itemIcon: Icons.draw_rounded,
                  itemName: AppLocalizations.of(context)!.methodTraditional,
                  itemDescription: AppLocalizations.of(context)!.methodTraditionalDescription,
                  isSelected: selectedGoalBoxIndex == 0,
                  onTap: () => handleMethodBoxTap(0),
                ),
                VerticalSpacing(12.0),
                MethodBox(
                  itemIcon: Icons.label_rounded,
                  itemName: AppLocalizations.of(context)!.methodLabels,
                  itemDescription: AppLocalizations.of(context)!.methodLabelsDescription,
                  isSelected: selectedGoalBoxIndex == 1,
                  onTap: () => handleMethodBoxTap(1),
                ),
                VerticalSpacing(12.0),
                MethodBox(
                  itemIcon: Icons.label_important_rounded,
                  itemName: AppLocalizations.of(context)!.methodPriorities,
                  itemDescription: AppLocalizations.of(context)!.methodPrioritiesDescription,
                  isSelected: selectedGoalBoxIndex == 2,
                  onTap: () => handleMethodBoxTap(2),
                ),
                VerticalSpacing(12.0),
                MethodBox(
                  itemIcon: Icons.sports_football_rounded,
                  itemName: AppLocalizations.of(context)!.methodProjects,
                  itemDescription: AppLocalizations.of(context)!.methodProjectsDescription,
                  isSelected: selectedGoalBoxIndex == 3,
                  onTap: () => handleMethodBoxTap(3),
                ),
                VerticalSpacing(12.0),
                MethodBox(
                  itemIcon: Icons.timer_rounded,
                  itemName: AppLocalizations.of(context)!.methodTimer,
                  itemDescription: AppLocalizations.of(context)!.methodTimerDescription,
                  isSelected: selectedGoalBoxIndex == 4,
                  onTap: () => handleMethodBoxTap(4),
                ),
              ],
            ),
          ]),
    );
    ;
  }
}
