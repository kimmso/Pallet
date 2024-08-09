import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:flutter_getx_palette_diary/src/utils/dio_interceptor.dart';

class EmailRepository {
  final dio = Dio()..interceptors.add(BaseInterceptor());

  // 사용자 이메일 데이터를 가져오는 API
  Future<String?> emailApi(String email) async {
    try {
      // 요청 데이터 준비
      final emailRequestData = {
        "email": email, // 사용자가 입력한 이메일을 여기에 대입
      };

      // API 요청
      final response = await dio.post(
        ApiUrls.emailUrl,
        data: jsonEncode(emailRequestData), // JSON 형식으로 인코딩
        options: Options(
          contentType: Headers.jsonContentType, // Content-Type을 JSON으로 설정
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        // 서버 응답에서 'code' 값을 추출
        final String? code = responseData['code'] as String?;

        // String code = response.data;
        return code;
      } else {
        print('Failed to fetch email data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching email data: $e');
      return null;
    }
  }
}
