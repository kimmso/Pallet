// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calenderdate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalenderDate _$CalenderDateFromJson(Map<String, dynamic> json) {
  return _CalenderDate.fromJson(json);
}

/// @nodoc
mixin _$CalenderDate {
  String? get update_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalenderDateCopyWith<CalenderDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderDateCopyWith<$Res> {
  factory $CalenderDateCopyWith(
          CalenderDate value, $Res Function(CalenderDate) then) =
      _$CalenderDateCopyWithImpl<$Res, CalenderDate>;
  @useResult
  $Res call({String? update_date});
}

/// @nodoc
class _$CalenderDateCopyWithImpl<$Res, $Val extends CalenderDate>
    implements $CalenderDateCopyWith<$Res> {
  _$CalenderDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update_date = freezed,
  }) {
    return _then(_value.copyWith(
      update_date: freezed == update_date
          ? _value.update_date
          : update_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalenderDateImplCopyWith<$Res>
    implements $CalenderDateCopyWith<$Res> {
  factory _$$CalenderDateImplCopyWith(
          _$CalenderDateImpl value, $Res Function(_$CalenderDateImpl) then) =
      __$$CalenderDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? update_date});
}

/// @nodoc
class __$$CalenderDateImplCopyWithImpl<$Res>
    extends _$CalenderDateCopyWithImpl<$Res, _$CalenderDateImpl>
    implements _$$CalenderDateImplCopyWith<$Res> {
  __$$CalenderDateImplCopyWithImpl(
      _$CalenderDateImpl _value, $Res Function(_$CalenderDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update_date = freezed,
  }) {
    return _then(_$CalenderDateImpl(
      update_date: freezed == update_date
          ? _value.update_date
          : update_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalenderDateImpl implements _CalenderDate {
  _$CalenderDateImpl({required this.update_date});

  factory _$CalenderDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalenderDateImplFromJson(json);

  @override
  final String? update_date;

  @override
  String toString() {
    return 'CalenderDate(update_date: $update_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderDateImpl &&
            (identical(other.update_date, update_date) ||
                other.update_date == update_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, update_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderDateImplCopyWith<_$CalenderDateImpl> get copyWith =>
      __$$CalenderDateImplCopyWithImpl<_$CalenderDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalenderDateImplToJson(
      this,
    );
  }
}

abstract class _CalenderDate implements CalenderDate {
  factory _CalenderDate({required final String? update_date}) =
      _$CalenderDateImpl;

  factory _CalenderDate.fromJson(Map<String, dynamic> json) =
      _$CalenderDateImpl.fromJson;

  @override
  String? get update_date;
  @override
  @JsonKey(ignore: true)
  _$$CalenderDateImplCopyWith<_$CalenderDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
