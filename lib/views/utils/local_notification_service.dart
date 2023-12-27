import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  Future<void> scheduleDailyNotification(int numberOfTasks, bool hasDailyReminder) async {
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
      numberOfTasks > 0
          ? 'You have $numberOfTasks ${numberOfTasks == 1 ? 'task' : 'tasks'} today. Reflect, prioritize, and conquer. Dive into PocketTasks now!'
          : 'No tasks for today. Enjoy your day! :)',
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
