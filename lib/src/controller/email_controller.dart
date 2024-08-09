import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_getx_palette_diary/src/view/get_number.dart';
import 'package:get/get.dart';
import '../repository/email_repository.dart';

class EmailController extends GetxController {
  final EmailRepository repository;
  final RxBool _isLoading = false.obs;
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  EmailController({
    required this.repository,
  });

  TextEditingController get email => _email;

  GlobalKey<FormState> get formKey => _formKey;

  bool get isLoading => _isLoading.value;

  void validationEmail() {
    _isLoading(true);
    if (_formKey.currentState!.validate()) {
      emailFetchData();
    }
  }

  // 이메일 데이터를 가져오는 메서드
  void emailFetchData() async {
    // 이메일 주소를 파라미터로 전달하여 emailApi 호출
    try {
      final code = await repository.emailApi(email.text);
      _isLoading(false);

      Get.to(() => GetNumberPage(code: code!));
    } on Exception catch (err) {
      print(err.toString());
    }
  }

  Future<String?> authFetchData(String email) async {
    // 이메일 주소를 파라미터로 전달하여 emailApi 호출
    try {
      print(email);
      final code = await repository.emailApi(email);

      _isLoading(false);
      return code;
    } on Exception catch (err) {
      print(err.toString());
    }
  }

  // 6자리 랜덤 코드를 생성하는 메서드
  int _generateRandomCode() {
    final random = Random();
    return 100000 + random.nextInt(900000); // 100000 ~ 999999 사이의 랜덤 숫자 생성
  }
}
