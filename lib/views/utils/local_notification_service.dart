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
      {
        bool withTasks = false,
        int numberOfTasks = 0,
        String description = "",
        required String title,
        required int scheduledHours,
        required int scheduledMinutes,
        required BuildContext context,
      })
  async {
    int notificationId = scheduledHours;

    tz.Location local = tz.local;
    tz.TZDateTime now = tz.TZDateTime.now(local);
    tz.TZDateTime scheduledTime =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, scheduledHours, scheduledMinutes);

    // If it's already past 12:00 PM today, schedule for tomorrow
    if (DateTime.now().hour >= scheduledHours) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    // Ensure the scheduled time is in the future
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    if (withTasks) {
      description = buildDailyNotificationMessage(numberOfTasks, context);
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        title,
        description,
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

  String buildDailyNotificationMessage(int numberOfTasks, BuildContext context) {
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

  Future<void> scheduleDailyNotifications(int numberOfTasks, bool hasDailyReminder, BuildContext context) async {
    if (!context.mounted) return; // Ensures context isn't null.

    if (hasDailyReminder) {

      // Morning notification

      scheduleNotification(
        title: AppLocalizations.of(context)!.morningTaskReview,
        description: AppLocalizations.of(context)!.morningTaskReviewBody,
        scheduledHours: 7,
        scheduledMinutes: 0,
        context: context,
      );

      // Check-in notification

      scheduleNotification(
        withTasks: true,
        numberOfTasks: numberOfTasks,
        title: AppLocalizations.of(context)!.yourDailyInsight,
        scheduledHours: 12,
        scheduledMinutes: 0,
        context: context,
      );

      // End of day notification

      scheduleNotification(
          title: AppLocalizations.of(context)!.nightTaskReview,
          description: AppLocalizations.of(context)!.nightTaskReviewBody,
          scheduledHours: 18,
          scheduledMinutes: 0,
          context: context,
      );
    } else {
      cancelDailyNotification();
    }
  }

  Future<void> cancelDailyNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
