import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pocket_tasks/l10n/l10n.dart';
import 'package:pocket_tasks/views/home_view.dart';
import 'package:pocket_tasks/views/onboarding_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pocket_tasks/views/styles/themes.dart';
import 'package:pocket_tasks/views/utils/audio_manager.dart';
import 'package:pocket_tasks/views/utils/local_notification_service.dart';
import 'package:pocket_tasks/views/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  AudioManager.init();
  AudioManager.instance.initializeSoundPreferences();
  final String timeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZone));
  await LocalNotificationService().init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userName = prefs.getString('userName');
  int? userGoalIndex = prefs.getInt('userGoal');
  int? preferredMethodIndex = prefs.getInt('preferredMethod');
  bool validUser = (userName != null && userGoalIndex != null && preferredMethodIndex != null);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Make sure ThemeProvider is created here
      child: MyApp(userExists: validUser),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool userExists;

  const MyApp({Key? key, required this.userExists}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Request audio focus when the app starts
    AudioManager.requestAudioFocus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    AudioManager.instance.cancelSoundPreferencesSubscription();
    AudioManager.stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App is in the foreground
      // Request audio focus and resume playback if needed
      AudioManager.requestAudioFocus();
    } else {
      // App is in the background
      // Pause playback and release audio focus if needed
      AudioManager.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _themeProvider.loadTheme();
    final isDarkModeEnabled = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return ChangeNotifierProvider(
      create: (_) => ThemeProvider()..loadTheme(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'PocketTasks',
            debugShowCheckedModeBanner: false,
            theme: isDarkModeEnabled ? AppThemes.defaultDark : themeProvider.currentTheme,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: widget.userExists ? const HomeView() : const OnboardingView(),
          );
        },
      ),
    );
  }
}