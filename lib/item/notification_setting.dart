import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_setting.freezed.dart';
part 'notification_setting.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class NotificationSetting with _$NotificationSetting {
  const factory NotificationSetting(
      {required int hour,
      required int minute,
      required bool loopFlag,
      required String comment,
      required int weekID}) = _NotificationSetting;

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  const NotificationSetting._();
}
