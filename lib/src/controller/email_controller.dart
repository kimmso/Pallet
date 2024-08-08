import 'dart:math';
import 'package:flutter_getx_palette_diary/src/model/email.dart';
import 'package:get/get.dart';
import '../repository/email_repository.dart';

class EmailController extends GetxController {
  final EmailRepository repository;

  EmailController({
    required this.repository,
  });

  // 이메일 데이터를 가져오는 메서드
  Future<String?> emailFetchData(String email) async {
    try {
      // 이메일 주소를 파라미터로 전달하여 emailApi 호출
      final String? code = await repository.emailApi(email);
      return code;
    } catch (e) {
      print('Error fetching email data: $e');
      return null;
    }
  }

  // 6자리 랜덤 코드를 생성하는 메서드
  int _generateRandomCode() {
    final random = Random();
    return 100000 + random.nextInt(900000); // 100000 ~ 999999 사이의 랜덤 숫자 생성
  }

  // // 입력한 이메일로 6자리 코드를 전송하는 메서드
  // Future<void> sendVerificationCode(String email) async {
  //   final code = _generateRandomCode();
  //   try {
  //     await repository.sendEmailWithCode(email, code);
  //     print('Verification code $code sent to $email');
  //   } catch (e) {
  //     print('Error sending verification code: $e');
  //     // 예외 처리를 추가할 수 있습니다 (예: 사용자에게 알림).
  //   }
  // }
}
