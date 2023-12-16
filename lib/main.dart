import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket_tasks/l10n/l10n.dart';
import 'package:pocket_tasks/views/home_view.dart';
import 'package:pocket_tasks/views/onboarding-view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userName = prefs.getString('userName');
  int? userGoalIndex = prefs.getInt('userGoal');
  int? preferredMethodIndex = prefs.getInt('preferredMethod');
  bool validUser = (userName != null &&
      userGoalIndex != null &&
      preferredMethodIndex != null);

  runApp(MyApp(userExists: validUser));
}

class MyApp extends StatelessWidget {
  final bool userExists;

  const MyApp({Key? key, required this.userExists});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PocketTasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: userExists ? const HomeView() : const OnboardingView(),
    );
  }
}
