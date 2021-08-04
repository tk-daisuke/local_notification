import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

enum notificatinWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
const List<int> dateTimeWeeklist = [
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday,
  DateTime.saturday,
  DateTime.sunday,
];
const List<String> japaneseWeeklist = [
  '月曜日',
  '火曜日',
  '水曜日',
  '木曜日',
  '金曜日',
  '土曜日',
  '日曜日',
];
// init
final providerNotificationInitialization = FutureProvider<bool?>((ref) async {
  final _notificationsPlugin = FlutterLocalNotificationsPlugin();
  const _androidSettings = AndroidInitializationSettings('ic_launcher');
  const _iOSSettings = IOSInitializationSettings();
  const _notificationInitSetting =
      InitializationSettings(android: _androidSettings, iOS: _iOSSettings);
  final init = await _notificationsPlugin.initialize(_notificationInitSetting);
  return init;
});
final notificationProvider =
    ChangeNotifierProvider((ref) => NotificationService());

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showInstantNotification() async {
    const ios = IOSNotificationDetails();
    const android = AndroidNotificationDetails('id', 'channel', 'description');
    const notificationSetting = NotificationDetails(android: android, iOS: ios);
    await _notificationsPlugin.show(0, 'タイトル', 'あ', notificationSetting,
        payload: 'InstantNotification');
  }

  Future<void> show5SecondsNotification() async {
    final interval =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    const ios = IOSNotificationDetails();
    const android = AndroidNotificationDetails('id', 'channel', 'description');

    await _notificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        interval,
        const NotificationDetails(iOS: ios, android: android),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> schedulenotification(
      {required int notificationID,
      required int hour,
      required notificatinWeek weekly}) async {
    const ios = IOSNotificationDetails();
    const android = AndroidNotificationDetails('id', 'channel', 'description');

    final interval = _nextInstanceOfWeekly(
      hour: hour,
      weekly: notificatinWeek.monday,
    );
    await _notificationsPlugin.zonedSchedule(
        notificationID,
        '${japaneseWeeklist[weekly.index]} $hour時の通知です',
        'scheduled body',
        interval,
        const NotificationDetails(iOS: ios, android: android),
        //Androidでは、androidAllowWhileIdleデバイスが低電力アイドルモードの場合でも、
        // 指定された時間に通知を配信するかどうかを決定するために使用されます。
        androidAllowWhileIdle: true,
        //iLocalNotificationDateInterpretation
        //タイムゾーンのサポートが限定されているとして10歳以上のiOSバージョンでとして必要とされます。
        //つまり、別のタイムゾーンの通知をスケジュールして、夏時間が発生したときに通知が表示される時間をiOSに調整させることはできません。
        //このパラメーターを使用して、スケジュールされた日付を絶対時間と実時間のどちらとして解釈するかを決定するために使用されます。
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  tz.TZDateTime _nextInstance({required int hour}) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfWeekly(
      {required notificatinWeek weekly, required int hour}) {
    var scheduledDate = _nextInstance(hour: hour);
    while (scheduledDate.weekday != dateTimeWeeklist[weekly.index]) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<List<PendingNotificationRequest>> getNotificationList() async =>
      _notificationsPlugin.pendingNotificationRequests();

  Future<void> cancelSelectNotification({required int notificationID}) async =>
      _notificationsPlugin.cancel(notificationID);

  Future<void> cancelAllNotifications() async =>
      _notificationsPlugin.cancelAll();
}

// tz.TZDateTime _nextInstanceOfTenAMLastYear() {
//   final now = tz.TZDateTime.now(tz.local);
//   return tz.TZDateTime(tz.local, now.year - 1, now.month, now.day, 10);
// }

// tz.TZDateTime _nextInstanceOfMondayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.monday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfTuesdayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.tuesday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfWednesdayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.wednesday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfThursdayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.thursday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfFridayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.friday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfSaturdayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.friday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// tz.TZDateTime _nextInstanceOfSundayTenAM() {
//   var scheduledDate = _nextInstanceOfTenAM();
//   while (scheduledDate.weekday != DateTime.sunday) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }
// Future<void> initialize() async {
//   const _androidSettings = AndroidInitializationSettings('ic_launcher');
//   const _iOSSettings = IOSInitializationSettings();
//   const _notificationInitSetting =
//       InitializationSettings(android: _androidSettings, iOS: _iOSSettings);
//   await _notificationsPlugin.initialize(_notificationInitSetting);
// }

//   //Image notification
// Future<void> showBigPictureNotification() async {
//   const notificationImage = BigPictureStyleInformation(
//       DrawableResourceAndroidBitmap('ic_launcher'),
//       largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
//       contentTitle: 'image',
//       summaryText: 'wawa',
//       htmlFormatContent: true,
//       htmlFormatContentTitle: true);

//   const android = AndroidNotificationDetails('id', 'channel', 'description',
//       styleInformation: notificationImage);

//   const notificationSetting = NotificationDetails(android: android);

//   await _notificationsPlugin.show(
//       0, 'Demo Image notification', 'T', notificationSetting,
//       payload: 'Welcome to demo app');
// }
