// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myprofil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyProfilImpl _$$MyProfilImplFromJson(Map<String, dynamic> json) =>
    _$MyProfilImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      total_like_count: (json['total_like_count'] as num?)?.toInt(),
      total_post_count: (json['total_post_count'] as num?)?.toInt(),
      myPost: (json['myPost'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyProfilImplToJson(_$MyProfilImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total_like_count': instance.total_like_count,
      'total_post_count': instance.total_post_count,
      'myPost': instance.myPost,
    };
