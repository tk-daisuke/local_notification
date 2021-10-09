import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_setting.dart';
import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;

final timezoneSelectIndex = StateProvider((ref) => 3);

class NotificationAddModel {
  final notificationService = NotificationService();
  Future<void> cancelAllNotifications() async =>
      notificationService.cancelAllNotifications();

  Future<void> addNotification(
    int listLength,
    StateController<NotificationSetting> settings,
  ) async {
    final value = NotificationValue(
        notificationID: listLength,
        weekID: settings.state.weekID,
        hour: settings.state.hour,
        minutes: settings.state.minute,
        title: '$listLength番目',
        comment: settings.state.comment,
        loopFlag: settings.state.loopFlag,
        locationName: tz.local.name);

    await notificationService.schedulenotification(
      value: value,
    );
  }
}
