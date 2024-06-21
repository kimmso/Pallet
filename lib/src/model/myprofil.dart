import 'package:flutter_getx_palette_diary/src/model/feed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'myprofil.freezed.dart';
part 'myprofil.g.dart';

@freezed
class MyProfil with _$MyProfil {
  factory MyProfil({
    required String? id,
    required String? name,
    required int? total_like_count,
    required int? total_post_count,
    required List<Feed> myPost,
  }) = _MyProfil;
  factory MyProfil.fromJson(Map<String, dynamic> json) =>
      _$MyProfilFromJson(json);
}
