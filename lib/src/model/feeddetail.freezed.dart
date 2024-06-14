// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeddetail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedDetail _$FeedDetailFromJson(Map<String, dynamic> json) {
  return _FeedDetail.fromJson(json);
}

/// @nodoc
mixin _$FeedDetail {
  String? get photo_url => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get create_date => throw _privateConstructorUsedError;
  int? get like_count => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get like => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedDetailCopyWith<FeedDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedDetailCopyWith<$Res> {
  factory $FeedDetailCopyWith(
          FeedDetail value, $Res Function(FeedDetail) then) =
      _$FeedDetailCopyWithImpl<$Res, FeedDetail>;
  @useResult
  $Res call(
      {String? photo_url,
      String? content,
      String? create_date,
      int? like_count,
      String? name,
      bool? like});
}

/// @nodoc
class _$FeedDetailCopyWithImpl<$Res, $Val extends FeedDetail>
    implements $FeedDetailCopyWith<$Res> {
  _$FeedDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo_url = freezed,
    Object? content = freezed,
    Object? create_date = freezed,
    Object? like_count = freezed,
    Object? name = freezed,
    Object? like = freezed,
  }) {
    return _then(_value.copyWith(
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      create_date: freezed == create_date
          ? _value.create_date
          : create_date // ignore: cast_nullable_to_non_nullable
              as String?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedDetailImplCopyWith<$Res>
    implements $FeedDetailCopyWith<$Res> {
  factory _$$FeedDetailImplCopyWith(
          _$FeedDetailImpl value, $Res Function(_$FeedDetailImpl) then) =
      __$$FeedDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? photo_url,
      String? content,
      String? create_date,
      int? like_count,
      String? name,
      bool? like});
}

/// @nodoc
class __$$FeedDetailImplCopyWithImpl<$Res>
    extends _$FeedDetailCopyWithImpl<$Res, _$FeedDetailImpl>
    implements _$$FeedDetailImplCopyWith<$Res> {
  __$$FeedDetailImplCopyWithImpl(
      _$FeedDetailImpl _value, $Res Function(_$FeedDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo_url = freezed,
    Object? content = freezed,
    Object? create_date = freezed,
    Object? like_count = freezed,
    Object? name = freezed,
    Object? like = freezed,
  }) {
    return _then(_$FeedDetailImpl(
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      create_date: freezed == create_date
          ? _value.create_date
          : create_date // ignore: cast_nullable_to_non_nullable
              as String?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedDetailImpl implements _FeedDetail {
  _$FeedDetailImpl(
      {required this.photo_url,
      required this.content,
      required this.create_date,
      required this.like_count,
      required this.name,
      required this.like});

  factory _$FeedDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedDetailImplFromJson(json);

  @override
  final String? photo_url;
  @override
  final String? content;
  @override
  final String? create_date;
  @override
  final int? like_count;
  @override
  final String? name;
  @override
  final bool? like;

  @override
  String toString() {
    return 'FeedDetail(photo_url: $photo_url, content: $content, create_date: $create_date, like_count: $like_count, name: $name, like: $like)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedDetailImpl &&
            (identical(other.photo_url, photo_url) ||
                other.photo_url == photo_url) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.create_date, create_date) ||
                other.create_date == create_date) &&
            (identical(other.like_count, like_count) ||
                other.like_count == like_count) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.like, like) || other.like == like));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, photo_url, content, create_date, like_count, name, like);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedDetailImplCopyWith<_$FeedDetailImpl> get copyWith =>
      __$$FeedDetailImplCopyWithImpl<_$FeedDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedDetailImplToJson(
      this,
    );
  }
}

abstract class _FeedDetail implements FeedDetail {
  factory _FeedDetail(
      {required final String? photo_url,
      required final String? content,
      required final String? create_date,
      required final int? like_count,
      required final String? name,
      required final bool? like}) = _$FeedDetailImpl;

  factory _FeedDetail.fromJson(Map<String, dynamic> json) =
      _$FeedDetailImpl.fromJson;

  @override
  String? get photo_url;
  @override
  String? get content;
  @override
  String? get create_date;
  @override
  int? get like_count;
  @override
  String? get name;
  @override
  bool? get like;
  @override
  @JsonKey(ignore: true)
  _$$FeedDetailImplCopyWith<_$FeedDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
