import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:timezone/timezone.dart' as tz;

final providerGetNotificationList =
    FutureProvider<List<PendingNotificationRequest>>((ref) async {
  final notificaitons = ref.read(notificaitonItems);
  final getNotificationList =
      await FlutterLocalNotificationsPlugin().pendingNotificationRequests();
  notificaitons.state = getNotificationList;
  return getNotificationList;
});

final notificaitonItems = StateProvider<List<PendingNotificationRequest>>(
  (ref) => [],
);

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

  Future<void> schedulenotification({required NotificationValue value}) async {
    const ios = IOSNotificationDetails();
    const android = AndroidNotificationDetails('id', 'channel', 'description');
    final interval = nextInstanceOfWeekly(
      hour: value.hour,
      weekly: value.weekID,
      timeZone: tz.TZDateTime.now(tz.local),
      minute: value.minutes,
    );
    final payload = value.toJson();
    await _notificationsPlugin.zonedSchedule(
      value.notificationID, value.title,
      value.comment,
      interval, const NotificationDetails(iOS: ios, android: android),
      payload: jsonEncode(payload),
      //Androidでは、androidAllowWhileIdleデバイスが低電力アイドルモードの場合でも、
      // 指定された時間に通知を配信するかどうかを決定するために使用されます。
      androidAllowWhileIdle: true,
// iOS8.0以降。10より古いバージョンのiOSでは、プラグインはUILocalNotificationAPIを使用します。
// UserNotification APIは（ユーザー通知フレームワーク別名）のiOS 10以降で使用されています。
// 10より古いバージョンのiOSで使用される通知API（別名UILocalNotificationAPI）は、
// スケジュールされた通知と夏時間 タイムゾーンでのサポートが制限されています。

      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,

// matchDateTimeComponentsプラグインに時刻または曜日と時刻の組み合わせにそれぞれ一致するように指示することにより、
// 通知が毎日または毎週表示されるようにスケジュールするために使用できるオプションのパラメーターがあります。
      matchDateTimeComponents:
          value.loopFlag ? DateTimeComponents.dayOfWeekAndTime : null,
    );
  }

  tz.TZDateTime nextInstanceOfWeekly(
      {required int weekly,
      required int hour,
      required int minute,
      required tz.TZDateTime timeZone}) {
    var scheduledDate =
        _nextInstance(hour: hour, timeZone: timeZone, minute: minute);
    while (scheduledDate.weekday != weekly) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    // print('_nextInstanceOfWeekly scheduledDate$scheduledDate');

    return scheduledDate;
  }

  tz.TZDateTime _nextInstance(
      {required int hour,
      required int minute,
      required tz.TZDateTime timeZone}) {
    final now = tz.TZDateTime.now(timeZone.location);

    var scheduledDate = tz.TZDateTime(
        timeZone.location, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(timeZone)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    // print('_nextInstance scheduledDate$scheduledDate');
    return scheduledDate;
  }

  Future<List<PendingNotificationRequest>> getNotificationList() async =>
      _notificationsPlugin.pendingNotificationRequests();

  Future<void> cancelSelectNotification({required int notificationID}) async =>
      _notificationsPlugin.cancel(notificationID);

  Future<void> cancelAllNotifications() async =>
      _notificationsPlugin.cancelAll();
}
