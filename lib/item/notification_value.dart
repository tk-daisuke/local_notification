import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_value.freezed.dart';
part 'notification_value.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class NotificationValue with _$NotificationValue {
  const factory NotificationValue(
      {required int notificationID,
      required int weekID,
      required int hour,
      required int minutes,
      required String title,
      required String comment,
      required bool loopFlag}) = _NotificationValue;

  factory NotificationValue.fromJson(Map<String, dynamic> json) =>
      _$NotificationValueFromJson(json);

  const NotificationValue._(); // メソッドを追加したい場合追加

}
