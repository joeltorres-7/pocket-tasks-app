import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_notification');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotification(String title, String description) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel_callout',
      'PocketTask Callout Channel',
      channelDescription: 'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      notificationId,
      title,
      description,
      notificationDetails,
      payload: 'Not present',
    );
  }

  Future<void> scheduleNotification(
      String title,
      String description,
      DateTime scheduledTime,
      ) async {
    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      title,
      description,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "channel-reminder",
          "Task Reminder Channel",
          channelDescription: "Channel dedicated to Task Reminders",
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  String buildNotificationMessage(int numberOfTasks, BuildContext context) {
    if (numberOfTasks > 0) {
      String taskString = (numberOfTasks > 1) ? AppLocalizations.of(context)!.tasksLower : AppLocalizations.of(context)!.taskLower;

      return '${AppLocalizations.of(context)!.youHave} $numberOfTasks ${taskString} ${AppLocalizations.of(context)!.todayPlain}. '
          '${AppLocalizations.of(context)!.reflect}, '
          '${AppLocalizations.of(context)!.prioritize}, '
          '${AppLocalizations.of(context)!.andConquer}. '
          '${AppLocalizations.of(context)!.diveIntoPocketTasksNow}';
    } else {
      return '${AppLocalizations.of(context)!.noTasksForToday}. '
          '${AppLocalizations.of(context)!.enjoyYourDay}! :)';
    }
  }

  Future<void> scheduleDailyNotification(int numberOfTasks, bool hasDailyReminder, BuildContext context) async {
    final bool enableTaskReminders = hasDailyReminder;

    if (!enableTaskReminders) {
      await cancelDailyNotification();
      return;
    }

    tz.Location local = tz.local;
    tz.TZDateTime now = tz.TZDateTime.now(local);
    tz.TZDateTime scheduledTime =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, 12, 0);

    // If it's already past 12:00 PM today, schedule for tomorrow
    if (DateTime.now().hour >= 12) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    // Ensure the scheduled time is in the future
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Your Daily Insight',
      buildNotificationMessage(numberOfTasks, context),
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel-daily-summary',
          'Daily Summary Channel',
          channelDescription: 'Channel for Daily Task Summary',
          icon: "@mipmap/ic_notification",
          playSound: true,
        ),
      ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime
    );
  }

  Future<void> cancelDailyNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
