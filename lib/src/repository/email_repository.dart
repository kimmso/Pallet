import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/email.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';

class EmailRepository {
  final dio = Dio();

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

      // 응답 상태 코드와 데이터 로그
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        String code = response.data;
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

  // // 6자리 코드를 이메일로 전송하는 기능 추가
  // Future<void> sendEmailWithCode(String email, String code) async {
  //   try {
  //     // Access token 읽기
  //     String? accessToken = GetStorage().read('accessToken');
  //     dio.options.headers = {'Authorization': 'Bearer $accessToken'};
  //     print('Access Token: $accessToken');

  //     // 요청 데이터 준비
  //     final requestData = {
  //       'email': email,
  //       'code': code, // 서버가 'code'를 문자열로 처리하는 경우 변환
  //     };

  //     // API 요청
  //     final response = await dio.post(
  //       ApiUrls.emailUrl, // 이메일 코드 전송 API URL
  //       data: jsonEncode(requestData), // JSON 형식으로 인코딩
  //       options: Options(
  //         contentType: Headers.jsonContentType, // Content-Type을 JSON으로 설정
  //       ),
  //     );

  //     // 응답 상태 코드와 데이터 로그
  //     print('Response Status Code: ${response.statusCode}');
  //     print('Response Data: ${response.data}');

  //     if (response.statusCode == 200) {
  //       print('Verification code sent successfully');
  //     } else {
  //       print('Failed to send verification code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error sending verification code: $e');
  //     throw Exception('Failed to send verification code');
  //   }
  // }

