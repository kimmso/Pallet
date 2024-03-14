// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostListImpl _$$PostListImplFromJson(Map<String, dynamic> json) =>
    _$PostListImpl(
      content: json['content'] as String?,
      photo_url: json['photo_url'] as String?,
      post_no: json['post_no'] as int?,
    );

Map<String, dynamic> _$$PostListImplToJson(_$PostListImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'photo_url': instance.photo_url,
      'post_no': instance.post_no,
    };
