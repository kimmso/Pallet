import 'package:get/get.dart';
import 'package:validators/validators.dart';

class ValidatorUtil {
  static bool validateName(String? value) {
    if (value == null || value.isEmpty) {
      Get.snackbar("이름 오류!", "공백이 들어갈 수 없습니다.");
      return false;
    }

    return true;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value != password) {
      return "비밀번호가 일치하지 않습니다.";
    } else {
      return null;
    }
  }

  static String? validateContent(String? value) {
    if (value == null || value.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value.length > 100) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  }

  static String? validateConfirmCode(String? value) {
    if (value == null || value.isEmpty) {
      return "공백이 들어갈 수 업습니다.";
    } else if (value.length == 8) {
      return "8자리를 입력해주세요.";
    } else {
      return null;
    }
  }
}
