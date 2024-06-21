// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myprofil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyProfil _$MyProfilFromJson(Map<String, dynamic> json) {
  return _MyProfil.fromJson(json);
}

/// @nodoc
mixin _$MyProfil {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get total_like_count => throw _privateConstructorUsedError;
  int? get total_post_count => throw _privateConstructorUsedError;
  List<Feed> get myPost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProfilCopyWith<MyProfil> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProfilCopyWith<$Res> {
  factory $MyProfilCopyWith(MyProfil value, $Res Function(MyProfil) then) =
      _$MyProfilCopyWithImpl<$Res, MyProfil>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? total_like_count,
      int? total_post_count,
      List<Feed> myPost});
}

/// @nodoc
class _$MyProfilCopyWithImpl<$Res, $Val extends MyProfil>
    implements $MyProfilCopyWith<$Res> {
  _$MyProfilCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? total_like_count = freezed,
    Object? total_post_count = freezed,
    Object? myPost = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total_like_count: freezed == total_like_count
          ? _value.total_like_count
          : total_like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      total_post_count: freezed == total_post_count
          ? _value.total_post_count
          : total_post_count // ignore: cast_nullable_to_non_nullable
              as int?,
      myPost: null == myPost
          ? _value.myPost
          : myPost // ignore: cast_nullable_to_non_nullable
              as List<Feed>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyProfilImplCopyWith<$Res>
    implements $MyProfilCopyWith<$Res> {
  factory _$$MyProfilImplCopyWith(
          _$MyProfilImpl value, $Res Function(_$MyProfilImpl) then) =
      __$$MyProfilImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? total_like_count,
      int? total_post_count,
      List<Feed> myPost});
}

/// @nodoc
class __$$MyProfilImplCopyWithImpl<$Res>
    extends _$MyProfilCopyWithImpl<$Res, _$MyProfilImpl>
    implements _$$MyProfilImplCopyWith<$Res> {
  __$$MyProfilImplCopyWithImpl(
      _$MyProfilImpl _value, $Res Function(_$MyProfilImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? total_like_count = freezed,
    Object? total_post_count = freezed,
    Object? myPost = null,
  }) {
    return _then(_$MyProfilImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total_like_count: freezed == total_like_count
          ? _value.total_like_count
          : total_like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      total_post_count: freezed == total_post_count
          ? _value.total_post_count
          : total_post_count // ignore: cast_nullable_to_non_nullable
              as int?,
      myPost: null == myPost
          ? _value._myPost
          : myPost // ignore: cast_nullable_to_non_nullable
              as List<Feed>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyProfilImpl implements _MyProfil {
  _$MyProfilImpl(
      {required this.id,
      required this.name,
      required this.total_like_count,
      required this.total_post_count,
      required final List<Feed> myPost})
      : _myPost = myPost;

  factory _$MyProfilImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyProfilImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? total_like_count;
  @override
  final int? total_post_count;
  final List<Feed> _myPost;
  @override
  List<Feed> get myPost {
    if (_myPost is EqualUnmodifiableListView) return _myPost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPost);
  }

  @override
  String toString() {
    return 'MyProfil(id: $id, name: $name, total_like_count: $total_like_count, total_post_count: $total_post_count, myPost: $myPost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyProfilImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total_like_count, total_like_count) ||
                other.total_like_count == total_like_count) &&
            (identical(other.total_post_count, total_post_count) ||
                other.total_post_count == total_post_count) &&
            const DeepCollectionEquality().equals(other._myPost, _myPost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, total_like_count,
      total_post_count, const DeepCollectionEquality().hash(_myPost));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyProfilImplCopyWith<_$MyProfilImpl> get copyWith =>
      __$$MyProfilImplCopyWithImpl<_$MyProfilImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyProfilImplToJson(
      this,
    );
  }
}

abstract class _MyProfil implements MyProfil {
  factory _MyProfil(
      {required final String? id,
      required final String? name,
      required final int? total_like_count,
      required final int? total_post_count,
      required final List<Feed> myPost}) = _$MyProfilImpl;

  factory _MyProfil.fromJson(Map<String, dynamic> json) =
      _$MyProfilImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get total_like_count;
  @override
  int? get total_post_count;
  @override
  List<Feed> get myPost;
  @override
  @JsonKey(ignore: true)
  _$$MyProfilImplCopyWith<_$MyProfilImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
