import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

class NotificationServise {
  static NotificationServise notificationServise = NotificationServise._();

  NotificationServise._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('notification');
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showSimpleNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android",
            sound: RawResourceAndroidNotificationSound('alert'));
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(1, "Flutter Notification",
        "Flutter Simple Notification", notificationDetails);
  }

  Future<void> showFirebaseNotification(title, body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android",
            sound: RawResourceAndroidNotificationSound('alert'));
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        1, "$title", "$body", notificationDetails);
  }

  Future<void> showSchedualNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android");
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: darwinNotificationDetails, android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        "Flutter Schedule Notification",
        "5 Sec",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> ShowBigPictureNotification() async {
    String link =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6lPZ8kYpgUNGt22M2NVhu4vG7ZPKkYVfRZrn2kBhSOLzI7DM6_Z_FPP36w0pmPz8z5ns&usqp=CAU";
    String bs64 = await uriToBase64(link);
    BigPictureStyleInformation big = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(bs64));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "Android", styleInformation: big);
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        1, "BigPicture", "Notifications With Image", notificationDetails);
  }

  Future<String> uriToBase64(String link) async {
    var response = await http.get(Uri.parse(link));
    var bs64 = base64Encode(response.bodyBytes);
    return bs64;
  }
}
