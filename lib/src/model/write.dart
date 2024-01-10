import 'package:freezed_annotation/freezed_annotation.dart';

part 'write.freezed.dart';
part 'write.g.dart';

@freezed
class Write with _$Write {
  factory Write({required String content}) = _Write;

  factory Write.fromJson(Map<String, dynamic> json) => _$WriteFromJson(json);
}
