import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/method_box.dart';
import 'package:pocket_tasks/views/components/task_methods.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class GetStartedMethods extends StatelessWidget {
  final UserData userData;
  final ValueChanged<PreferredMethod> onMethodChanged;

  GetStartedMethods({required this.onMethodChanged, required this.userData});

  int selectedMethodBoxIndex = -1;

  bool isMethodSelected(int index) {
    return selectedMethodBoxIndex == index;
  }

  void handleMethodBoxTap(BuildContext context, int index) {
    selectedMethodBoxIndex = index;
    onMethodChanged(TaskMethods.methodsList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.yourMethods, style: AppTextStyles.regular),
          VerticalSpacing(24.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < TaskMethods.methodsText(context).length; i++)
                Column(
                  children: [
                    MethodBox(
                      itemIcon: TaskMethods.methodsIcon[i],
                      itemName: TaskMethods.methodsText(context)[i],
                      itemDescription: AppLocalizations.of(context)!.methodTraditionalDescription,
                      onTap: () => handleMethodBoxTap(context, i),
                      isSelected: isMethodSelected(i),
                    ),
                    if (i < TaskMethods.methodsText(context).length - 1) VerticalSpacing(12.0),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
