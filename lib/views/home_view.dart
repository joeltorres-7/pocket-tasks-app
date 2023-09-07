import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/accessible_icon_button.dart';
import 'package:pocket_tasks/views/components/task_tabs.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String userName = 'Haru';

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
                          '${AppLocalizations.of(context)!.myInbox}, $userName!',
                          style: AppTextStyles.heading1,
                          textAlign: TextAlign.start),
                    ),
                    Text('${AppLocalizations.of(context)!.readyDay}',
                        style: AppTextStyles.subheading1,
                        textAlign: TextAlign.start),
                  ],
                ),
                AccessibleIconButton(
                    icon: Icons.settings,
                    onTap: () {
                      print('Settings clicked!');
                    }),
              ],
            ),
            VerticalSpacing(24.0),
            Expanded(child: TaskTabs()),
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
              onPressed: () {},
              backgroundColor: AppColors.secondaryGray,
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.query_builder, color: Colors.black),
            ),
            VerticalSpacing(12.0),
            FloatingActionButton(
              onPressed: () {},
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
