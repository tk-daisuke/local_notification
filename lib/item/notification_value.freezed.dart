// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationValue _$NotificationValueFromJson(Map<String, dynamic> json) {
  return _NotificationValue.fromJson(json);
}

/// @nodoc
class _$NotificationValueTearOff {
  const _$NotificationValueTearOff();

  _NotificationValue call(
      {required int notificationID,
      required int weekID,
      required int hour,
      required int minutes,
      required String title,
      required String comment,
      required String locationName,
      required bool loopFlag}) {
    return _NotificationValue(
      notificationID: notificationID,
      weekID: weekID,
      hour: hour,
      minutes: minutes,
      title: title,
      comment: comment,
      locationName: locationName,
      loopFlag: loopFlag,
    );
  }

  NotificationValue fromJson(Map<String, Object> json) {
    return NotificationValue.fromJson(json);
  }
}

/// @nodoc
const $NotificationValue = _$NotificationValueTearOff();

/// @nodoc
mixin _$NotificationValue {
  int get notificationID => throw _privateConstructorUsedError;
  int get weekID => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  bool get loopFlag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationValueCopyWith<NotificationValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationValueCopyWith<$Res> {
  factory $NotificationValueCopyWith(
          NotificationValue value, $Res Function(NotificationValue) then) =
      _$NotificationValueCopyWithImpl<$Res>;
  $Res call(
      {int notificationID,
      int weekID,
      int hour,
      int minutes,
      String title,
      String comment,
      String locationName,
      bool loopFlag});
}

/// @nodoc
class _$NotificationValueCopyWithImpl<$Res>
    implements $NotificationValueCopyWith<$Res> {
  _$NotificationValueCopyWithImpl(this._value, this._then);

  final NotificationValue _value;
  // ignore: unused_field
  final $Res Function(NotificationValue) _then;

  @override
  $Res call({
    Object? notificationID = freezed,
    Object? weekID = freezed,
    Object? hour = freezed,
    Object? minutes = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? locationName = freezed,
    Object? loopFlag = freezed,
  }) {
    return _then(_value.copyWith(
      notificationID: notificationID == freezed
          ? _value.notificationID
          : notificationID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NotificationValueCopyWith<$Res>
    implements $NotificationValueCopyWith<$Res> {
  factory _$NotificationValueCopyWith(
          _NotificationValue value, $Res Function(_NotificationValue) then) =
      __$NotificationValueCopyWithImpl<$Res>;
  @override
  $Res call(
      {int notificationID,
      int weekID,
      int hour,
      int minutes,
      String title,
      String comment,
      String locationName,
      bool loopFlag});
}

/// @nodoc
class __$NotificationValueCopyWithImpl<$Res>
    extends _$NotificationValueCopyWithImpl<$Res>
    implements _$NotificationValueCopyWith<$Res> {
  __$NotificationValueCopyWithImpl(
      _NotificationValue _value, $Res Function(_NotificationValue) _then)
      : super(_value, (v) => _then(v as _NotificationValue));

  @override
  _NotificationValue get _value => super._value as _NotificationValue;

  @override
  $Res call({
    Object? notificationID = freezed,
    Object? weekID = freezed,
    Object? hour = freezed,
    Object? minutes = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? locationName = freezed,
    Object? loopFlag = freezed,
  }) {
    return _then(_NotificationValue(
      notificationID: notificationID == freezed
          ? _value.notificationID
          : notificationID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationValue extends _NotificationValue
    with DiagnosticableTreeMixin {
  const _$_NotificationValue(
      {required this.notificationID,
      required this.weekID,
      required this.hour,
      required this.minutes,
      required this.title,
      required this.comment,
      required this.locationName,
      required this.loopFlag})
      : super._();

  factory _$_NotificationValue.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationValueFromJson(json);

  @override
  final int notificationID;
  @override
  final int weekID;
  @override
  final int hour;
  @override
  final int minutes;
  @override
  final String title;
  @override
  final String comment;
  @override
  final String locationName;
  @override
  final bool loopFlag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationValue(notificationID: $notificationID, weekID: $weekID, hour: $hour, minutes: $minutes, title: $title, comment: $comment, locationName: $locationName, loopFlag: $loopFlag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationValue'))
      ..add(DiagnosticsProperty('notificationID', notificationID))
      ..add(DiagnosticsProperty('weekID', weekID))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minutes', minutes))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('locationName', locationName))
      ..add(DiagnosticsProperty('loopFlag', loopFlag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationValue &&
            (identical(other.notificationID, notificationID) ||
                const DeepCollectionEquality()
                    .equals(other.notificationID, notificationID)) &&
            (identical(other.weekID, weekID) ||
                const DeepCollectionEquality().equals(other.weekID, weekID)) &&
            (identical(other.hour, hour) ||
                const DeepCollectionEquality().equals(other.hour, hour)) &&
            (identical(other.minutes, minutes) ||
                const DeepCollectionEquality()
                    .equals(other.minutes, minutes)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.locationName, locationName) ||
                const DeepCollectionEquality()
                    .equals(other.locationName, locationName)) &&
            (identical(other.loopFlag, loopFlag) ||
                const DeepCollectionEquality()
                    .equals(other.loopFlag, loopFlag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notificationID) ^
      const DeepCollectionEquality().hash(weekID) ^
      const DeepCollectionEquality().hash(hour) ^
      const DeepCollectionEquality().hash(minutes) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(locationName) ^
      const DeepCollectionEquality().hash(loopFlag);

  @JsonKey(ignore: true)
  @override
  _$NotificationValueCopyWith<_NotificationValue> get copyWith =>
      __$NotificationValueCopyWithImpl<_NotificationValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationValueToJson(this);
  }
}

abstract class _NotificationValue extends NotificationValue {
  const factory _NotificationValue(
      {required int notificationID,
      required int weekID,
      required int hour,
      required int minutes,
      required String title,
      required String comment,
      required String locationName,
      required bool loopFlag}) = _$_NotificationValue;
  const _NotificationValue._() : super._();

  factory _NotificationValue.fromJson(Map<String, dynamic> json) =
      _$_NotificationValue.fromJson;

  @override
  int get notificationID => throw _privateConstructorUsedError;
  @override
  int get weekID => throw _privateConstructorUsedError;
  @override
  int get hour => throw _privateConstructorUsedError;
  @override
  int get minutes => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  String get locationName => throw _privateConstructorUsedError;
  @override
  bool get loopFlag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationValueCopyWith<_NotificationValue> get copyWith =>
      throw _privateConstructorUsedError;
}
