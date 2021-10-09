// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationSetting _$NotificationSettingFromJson(Map<String, dynamic> json) {
  return _NotificationSetting.fromJson(json);
}

/// @nodoc
class _$NotificationSettingTearOff {
  const _$NotificationSettingTearOff();

  _NotificationSetting call(
      {required int hour,
      required int minute,
      required bool loopFlag,
      required String comment,
      required int weekID}) {
    return _NotificationSetting(
      hour: hour,
      minute: minute,
      loopFlag: loopFlag,
      comment: comment,
      weekID: weekID,
    );
  }

  NotificationSetting fromJson(Map<String, Object> json) {
    return NotificationSetting.fromJson(json);
  }
}

/// @nodoc
const $NotificationSetting = _$NotificationSettingTearOff();

/// @nodoc
mixin _$NotificationSetting {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  bool get loopFlag => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get weekID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSettingCopyWith<NotificationSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingCopyWith<$Res> {
  factory $NotificationSettingCopyWith(
          NotificationSetting value, $Res Function(NotificationSetting) then) =
      _$NotificationSettingCopyWithImpl<$Res>;
  $Res call({int hour, int minute, bool loopFlag, String comment, int weekID});
}

/// @nodoc
class _$NotificationSettingCopyWithImpl<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  _$NotificationSettingCopyWithImpl(this._value, this._then);

  final NotificationSetting _value;
  // ignore: unused_field
  final $Res Function(NotificationSetting) _then;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
    Object? loopFlag = freezed,
    Object? comment = freezed,
    Object? weekID = freezed,
  }) {
    return _then(_value.copyWith(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NotificationSettingCopyWith<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  factory _$NotificationSettingCopyWith(_NotificationSetting value,
          $Res Function(_NotificationSetting) then) =
      __$NotificationSettingCopyWithImpl<$Res>;
  @override
  $Res call({int hour, int minute, bool loopFlag, String comment, int weekID});
}

/// @nodoc
class __$NotificationSettingCopyWithImpl<$Res>
    extends _$NotificationSettingCopyWithImpl<$Res>
    implements _$NotificationSettingCopyWith<$Res> {
  __$NotificationSettingCopyWithImpl(
      _NotificationSetting _value, $Res Function(_NotificationSetting) _then)
      : super(_value, (v) => _then(v as _NotificationSetting));

  @override
  _NotificationSetting get _value => super._value as _NotificationSetting;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
    Object? loopFlag = freezed,
    Object? comment = freezed,
    Object? weekID = freezed,
  }) {
    return _then(_NotificationSetting(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationSetting extends _NotificationSetting
    with DiagnosticableTreeMixin {
  const _$_NotificationSetting(
      {required this.hour,
      required this.minute,
      required this.loopFlag,
      required this.comment,
      required this.weekID})
      : super._();

  factory _$_NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationSettingFromJson(json);

  @override
  final int hour;
  @override
  final int minute;
  @override
  final bool loopFlag;
  @override
  final String comment;
  @override
  final int weekID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSetting(hour: $hour, minute: $minute, loopFlag: $loopFlag, comment: $comment, weekID: $weekID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationSetting'))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minute', minute))
      ..add(DiagnosticsProperty('loopFlag', loopFlag))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('weekID', weekID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationSetting &&
            (identical(other.hour, hour) ||
                const DeepCollectionEquality().equals(other.hour, hour)) &&
            (identical(other.minute, minute) ||
                const DeepCollectionEquality().equals(other.minute, minute)) &&
            (identical(other.loopFlag, loopFlag) ||
                const DeepCollectionEquality()
                    .equals(other.loopFlag, loopFlag)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.weekID, weekID) ||
                const DeepCollectionEquality().equals(other.weekID, weekID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hour) ^
      const DeepCollectionEquality().hash(minute) ^
      const DeepCollectionEquality().hash(loopFlag) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(weekID);

  @JsonKey(ignore: true)
  @override
  _$NotificationSettingCopyWith<_NotificationSetting> get copyWith =>
      __$NotificationSettingCopyWithImpl<_NotificationSetting>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationSettingToJson(this);
  }
}

abstract class _NotificationSetting extends NotificationSetting {
  const factory _NotificationSetting(
      {required int hour,
      required int minute,
      required bool loopFlag,
      required String comment,
      required int weekID}) = _$_NotificationSetting;
  const _NotificationSetting._() : super._();

  factory _NotificationSetting.fromJson(Map<String, dynamic> json) =
      _$_NotificationSetting.fromJson;

  @override
  int get hour => throw _privateConstructorUsedError;
  @override
  int get minute => throw _privateConstructorUsedError;
  @override
  bool get loopFlag => throw _privateConstructorUsedError;
  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  int get weekID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationSettingCopyWith<_NotificationSetting> get copyWith =>
      throw _privateConstructorUsedError;
}
