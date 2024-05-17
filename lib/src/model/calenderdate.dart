import 'package:freezed_annotation/freezed_annotation.dart';

part 'calenderdate.freezed.dart';
part 'calenderdate.g.dart';

@freezed
class CalenderDate with _$CalenderDate {
  factory CalenderDate({
    required String? create_date,
  }) = _CalenderDate;
  factory CalenderDate.fromJson(Map<String, dynamic> json) =>
      _$CalenderDateFromJson(json);
}
