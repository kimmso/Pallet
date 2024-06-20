import 'package:freezed_annotation/freezed_annotation.dart';

part 'feeddetail.freezed.dart';
part 'feeddetail.g.dart';

@freezed
class FeedDetail with _$FeedDetail {
  factory FeedDetail({
    required String? photo_url,
    required String? content,
    required String? create_date,
    required int? like_count,
    required String? name,
    required bool? like,
  }) = _FeedDetail;

  factory FeedDetail.fromJson(Map<String, dynamic> json) =>
      _$FeedDetailFromJson(json);
}
