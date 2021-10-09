import 'dart:convert';

import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:timezone/timezone.dart' as tz;

class JsonService {
  NotificationValue payloadConverter(String payload) {
    final Map<String, dynamic> jsonConvert = json.decode(payload);
    final value = NotificationValue.fromJson(jsonConvert['detail'] ??
        NotificationValue(
                notificationID: 0,
                weekID: 0,
                hour: 0,
                minutes: 0,
                title: 'error',
                comment: 'error',
                loopFlag: false,
                locationName: tz.local.name)
            .toJson());
    return value;
  }
}
