// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostList _$PostListFromJson(Map<String, dynamic> json) {
  return _PostList.fromJson(json);
}

/// @nodoc
mixin _$PostList {
  String? get content => throw _privateConstructorUsedError;
  String? get photo_url => throw _privateConstructorUsedError;
  int? get post_no => throw _privateConstructorUsedError;
  int? get like_count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostListCopyWith<PostList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListCopyWith<$Res> {
  factory $PostListCopyWith(PostList value, $Res Function(PostList) then) =
      _$PostListCopyWithImpl<$Res, PostList>;
  @useResult
  $Res call(
      {String? content, String? photo_url, int? post_no, int? like_count});
}

/// @nodoc
class _$PostListCopyWithImpl<$Res, $Val extends PostList>
    implements $PostListCopyWith<$Res> {
  _$PostListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? photo_url = freezed,
    Object? post_no = freezed,
    Object? like_count = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      post_no: freezed == post_no
          ? _value.post_no
          : post_no // ignore: cast_nullable_to_non_nullable
              as int?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostListImplCopyWith<$Res>
    implements $PostListCopyWith<$Res> {
  factory _$$PostListImplCopyWith(
          _$PostListImpl value, $Res Function(_$PostListImpl) then) =
      __$$PostListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? content, String? photo_url, int? post_no, int? like_count});
}

/// @nodoc
class __$$PostListImplCopyWithImpl<$Res>
    extends _$PostListCopyWithImpl<$Res, _$PostListImpl>
    implements _$$PostListImplCopyWith<$Res> {
  __$$PostListImplCopyWithImpl(
      _$PostListImpl _value, $Res Function(_$PostListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? photo_url = freezed,
    Object? post_no = freezed,
    Object? like_count = freezed,
  }) {
    return _then(_$PostListImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      post_no: freezed == post_no
          ? _value.post_no
          : post_no // ignore: cast_nullable_to_non_nullable
              as int?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostListImpl implements _PostList {
  _$PostListImpl(
      {required this.content,
      required this.photo_url,
      required this.post_no,
      required this.like_count});

  factory _$PostListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostListImplFromJson(json);

  @override
  final String? content;
  @override
  final String? photo_url;
  @override
  final int? post_no;
  @override
  final int? like_count;

  @override
  String toString() {
    return 'PostList(content: $content, photo_url: $photo_url, post_no: $post_no, like_count: $like_count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.photo_url, photo_url) ||
                other.photo_url == photo_url) &&
            (identical(other.post_no, post_no) || other.post_no == post_no) &&
            (identical(other.like_count, like_count) ||
                other.like_count == like_count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, photo_url, post_no, like_count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListImplCopyWith<_$PostListImpl> get copyWith =>
      __$$PostListImplCopyWithImpl<_$PostListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostListImplToJson(
      this,
    );
  }
}

abstract class _PostList implements PostList {
  factory _PostList(
      {required final String? content,
      required final String? photo_url,
      required final int? post_no,
      required final int? like_count}) = _$PostListImpl;

  factory _PostList.fromJson(Map<String, dynamic> json) =
      _$PostListImpl.fromJson;

  @override
  String? get content;
  @override
  String? get photo_url;
  @override
  int? get post_no;
  @override
  int? get like_count;
  @override
  @JsonKey(ignore: true)
  _$$PostListImplCopyWith<_$PostListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
