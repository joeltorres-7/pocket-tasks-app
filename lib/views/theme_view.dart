import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/method_box.dart';
import 'package:pocket_tasks/views/components/option_item.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  String selectedTheme = 'default';

  @override
  void initState() {
    super.initState();
    _getSelectedTheme();
  }

  Future<void> _getSelectedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        selectedTheme = prefs.getString('userTheme') ?? 'default';
      });
    } catch (e) {
      print('Error requesting theme from SharedPreferences: $e');
    }
  }

  void _updateSelected(String selectedId) {
    setState(() {
      selectedTheme = selectedId;
    });
  }

  bool _isThemeSelected(String themeId) {
    return (themeId == selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              elevation: 4,
              shadowColor: Colors.grey[100]!,
              backgroundColor: Theme.of(context).colorScheme.background,
              scrolledUnderElevation: 0.4,
              title: Text(
                AppLocalizations.of(context)!.settingsTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  enableFeedback: false,
                  onPressed: () {
                    AudioManager.playFromName('back.wav');
                    Navigator.of(context).pop();
                  }
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // Items
                OptionItem(
                    label: AppLocalizations.of(context)!.selectTheme,
                    description: AppLocalizations.of(context)!.selectThemeDescription,
                    isClickable: false,
                    onTap: (){}
                ),
                VerticalSpacing(8.0),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                  child: Column(
                    children: [
                      MethodBox(
                          itemName: "PocketTasks",
                          itemIcon: Icons.bolt_rounded,
                          onTap: () {
                            AudioManager.playFromName('back.wav');
                            _updateSelected('default');
                            Provider.of<ThemeProvider>(context, listen: false)
                                .setTheme('default');
                          },
                          isSelected: _isThemeSelected('default'),
                          itemDescription: "Un tema enfocado y minimalista"
                      ),
                      VerticalSpacing(8.0),
                      MethodBox(
                          itemName: "Sakura",
                          itemIcon: Icons.filter_vintage_rounded,
                          onTap: () {
                            AudioManager.playFromName('back.wav');
                            _updateSelected('sakura');
                            Provider.of<ThemeProvider>(context, listen: false)
                                .setTheme('sakura');
                          },
                          isSelected: _isThemeSelected('sakura'),
                          itemDescription: "Inspirado por la tonalidad de los arboles de cerezos"
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(16.0)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
