import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:pocket_tasks/models/UserData.dart';
import 'package:pocket_tasks/views/components/method_box.dart';
import 'package:pocket_tasks/views/components/task_methods.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class GetStartedMethods extends StatefulWidget {
  final UserData userData;
  final ValueChanged<PreferredMethod> onMethodChanged;

  GetStartedMethods({super.key, required this.onMethodChanged, required this.userData});

  @override
  _GetStartedMethodsState createState() => _GetStartedMethodsState();
}

class _GetStartedMethodsState extends State<GetStartedMethods> {
  int selectedMethodBoxIndex = -1;

  bool isMethodSelected(int index) {
    return selectedMethodBoxIndex == index;
  }

  void handleMethodBoxTap(BuildContext context, int index) {
    setState(() {
      selectedMethodBoxIndex = index;
    });
    widget.onMethodChanged(TaskMethods.methodsList[index]);
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
              AppLocalizations.of(context)!.yourMethods,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
          ),
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
                      itemDescription: TaskMethods.methodsDescription(context)[i],
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
