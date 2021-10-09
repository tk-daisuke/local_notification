// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationSetting _$_$_NotificationSettingFromJson(
    Map<String, dynamic> json) {
  return _$_NotificationSetting(
    hour: json['hour'] as int,
    minute: json['minute'] as int,
    loopFlag: json['loopFlag'] as bool,
    comment: json['comment'] as String,
    weekID: json['weekID'] as int,
  );
}

Map<String, dynamic> _$_$_NotificationSettingToJson(
        _$_NotificationSetting instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'loopFlag': instance.loopFlag,
      'comment': instance.comment,
      'weekID': instance.weekID,
    };
