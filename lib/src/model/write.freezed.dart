// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Write _$WriteFromJson(Map<String, dynamic> json) {
  return _Write.fromJson(json);
}

/// @nodoc
mixin _$Write {
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WriteCopyWith<Write> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteCopyWith<$Res> {
  factory $WriteCopyWith(Write value, $Res Function(Write) then) =
      _$WriteCopyWithImpl<$Res, Write>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$WriteCopyWithImpl<$Res, $Val extends Write>
    implements $WriteCopyWith<$Res> {
  _$WriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WriteImplCopyWith<$Res> implements $WriteCopyWith<$Res> {
  factory _$$WriteImplCopyWith(
          _$WriteImpl value, $Res Function(_$WriteImpl) then) =
      __$$WriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$WriteImplCopyWithImpl<$Res>
    extends _$WriteCopyWithImpl<$Res, _$WriteImpl>
    implements _$$WriteImplCopyWith<$Res> {
  __$$WriteImplCopyWithImpl(
      _$WriteImpl _value, $Res Function(_$WriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$WriteImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WriteImpl implements _Write {
  _$WriteImpl({required this.content});

  factory _$WriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$WriteImplFromJson(json);

  @override
  final String content;

  @override
  String toString() {
    return 'Write(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WriteImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WriteImplCopyWith<_$WriteImpl> get copyWith =>
      __$$WriteImplCopyWithImpl<_$WriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WriteImplToJson(
      this,
    );
  }
}

abstract class _Write implements Write {
  factory _Write({required final String content}) = _$WriteImpl;

  factory _Write.fromJson(Map<String, dynamic> json) = _$WriteImpl.fromJson;

  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$WriteImplCopyWith<_$WriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
