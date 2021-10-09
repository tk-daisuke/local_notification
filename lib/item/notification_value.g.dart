// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationValue _$_$_NotificationValueFromJson(Map<String, dynamic> json) {
  return _$_NotificationValue(
    notificationID: json['notificationID'] as int,
    weekID: json['weekID'] as int,
    hour: json['hour'] as int,
    minutes: json['minutes'] as int,
    title: json['title'] as String,
    comment: json['comment'] as String,
    locationName: json['locationName'] as String,
    loopFlag: json['loopFlag'] as bool,
  );
}

Map<String, dynamic> _$_$_NotificationValueToJson(
        _$_NotificationValue instance) =>
    <String, dynamic>{
      'notificationID': instance.notificationID,
      'weekID': instance.weekID,
      'hour': instance.hour,
      'minutes': instance.minutes,
      'title': instance.title,
      'comment': instance.comment,
      'locationName': instance.locationName,
      'loopFlag': instance.loopFlag,
    };
