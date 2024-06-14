// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeddetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedDetailImpl _$$FeedDetailImplFromJson(Map<String, dynamic> json) =>
    _$FeedDetailImpl(
      photo_url: json['photo_url'] as String?,
      content: json['content'] as String?,
      create_date: json['create_date'] as String?,
      like_count: (json['like_count'] as num?)?.toInt(),
      name: json['name'] as String?,
      like: json['like'] as bool?,
    );

Map<String, dynamic> _$$FeedDetailImplToJson(_$FeedDetailImpl instance) =>
    <String, dynamic>{
      'photo_url': instance.photo_url,
      'content': instance.content,
      'create_date': instance.create_date,
      'like_count': instance.like_count,
      'name': instance.name,
      'like': instance.like,
    };
