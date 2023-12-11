import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/components/empty_queue.dart';

class TaskTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<TaskTabs> {
  int _selectedTabIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabs: [AppLocalizations.of(context)!.myInbox, AppLocalizations.of(context)!.todayFocus],
          selectedIndex: _selectedTabIndex,
          onTabTapped: _onTabTapped,
        ),
        Expanded(
          child: _selectedTabIndex == 0
              ? _buildMyInboxContent()
              : _buildTodaysFocusContent(),
        ),
      ],
    );
  }

  Widget _buildMyInboxContent() {
    return EmptyQueue();
  }

  Widget _buildTodaysFocusContent() {
    return EmptyQueue();
  }
}