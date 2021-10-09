import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_setting.dart';
import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:riverpod_test_application/service/json_service.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;

class SubscribeModel {
  final jsonService = JsonService();
  final notificationService = NotificationService();

  NotificationValue payloadConverter(String payload) {
    return jsonService.payloadConverter(payload);
  }
  tz.TZDateTime getRegisteredNotificationTime(
      int weekly, int hour, int minute, String timeZone) {
    final location = tz.getLocation(timeZone);
    final locationNow = tz.TZDateTime.now(location);
    final nextTime = notificationService.nextInstanceOfWeekly(
        weekly: weekly, hour: hour, minute: minute, timeZone: locationNow);

    return nextTime;
  }

  // tz.TZDateTime getRegisteredNotificationTime(
  //   int weekly,
  //   int hour,
  //   int minute,
  // ) {
  //   // final location = tz.getLocation(timeZone);
  //   final locationNow = tz.TZDateTime.now(tz.local);
  //   final nextTime = notificationService.nextInstanceOfWeekly(
  //       weekly: weekly, hour: hour, minute: minute, timeZone: locationNow);

  //   return nextTime;
  // }

  Future<void> timeEdit(BuildContext context, TimeOfDay _noticeTime,
      StateController<NotificationSetting> _settings) async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: _noticeTime,
    );
    if (timeOfDay != null) {
      _settings.state = NotificationSetting(
          hour: timeOfDay.hour,
          minute: timeOfDay.minute,
          loopFlag: _settings.state.loopFlag,
          comment: _settings.state.comment,
          weekID: _settings.state.weekID);
    }
  }

  Future<void> deleteNotification(int id) async =>
      notificationService.cancelSelectNotification(notificationID: id);

  Future<void> editNotification(
      int id,
      String title,
      StateController<NotificationSetting> settings,
      BuildContext context) async {
    final value = NotificationValue(
        notificationID: id,
        weekID: settings.state.weekID,
        hour: settings.state.hour,
        minutes: settings.state.minute,
        title: title,
        comment: settings.state.comment,
        loopFlag: settings.state.loopFlag,
        locationName: tz.local.name);

    await notificationService.schedulenotification(
      value: value,
    );
  }
}
