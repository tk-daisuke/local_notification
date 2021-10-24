import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_setting.dart';
import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;

final timezoneSelectIndex = StateProvider((ref) => 3);

class NotificationAddModel {
  final notificationService = NotificationService();
  final weekList = ['月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'];

  Future<void> cancelAllNotifications() async =>
      notificationService.cancelAllNotifications();

  Future<void> addNotification(
    StateController<List<PendingNotificationRequest>> list,
    StateController<NotificationSetting> settings,
  ) async {
    final listState = list.state.map((e) => e.id).toList();
    var notificationID = 0;
    print(listState);

    for (var i = 0; i < listState.length + 1; i++) {
      if (!listState.contains(i)) {
        notificationID = i;
      }
    }

    // print(list.state.length);
    print(notificationID);

    final value = NotificationValue(
        notificationID: notificationID,
        weekID: settings.state.weekID,
        hour: settings.state.hour,
        minutes: settings.state.minute,
        title: '${weekList[settings.state.weekID - 1]}の通知です',
        comment: settings.state.comment,
        loopFlag: settings.state.loopFlag,
        locationName: tz.local.name);

    await notificationService.schedulenotification(
      value: value,
    );
  }

  int getWeekID(String value) {
    if (value == weekList[0]) {
      return DateTime.monday;
    } else if (value == weekList[1]) {
      return DateTime.tuesday;
    } else if (value == weekList[2]) {
      return DateTime.wednesday;
    } else if (value == weekList[3]) {
      return DateTime.thursday;
    } else if (value == weekList[4]) {
      return DateTime.friday;
    } else if (value == weekList[5]) {
      return DateTime.saturday;
    } else if (value == weekList[6]) {
      return DateTime.sunday;
    } else {
      return DateTime.sunday;
    }
  }
}
