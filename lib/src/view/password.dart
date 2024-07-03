import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class PasswordPage extends GetView<UserController> {
  PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('비밀번호 변경하기'),
        ),
        body: _password());
  }

  Widget _password() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hint: "새로운 비밀번호",
            validator: ValidatorUtil.validatePassword,
            controller: controller.signupPassword,
          ),
          CustomTextField(
            hint: "새로운 비밀번호 확인",
            validator: (value) => ValidatorUtil.validateConfirmPassword(
                value, controller.confirmPassword.text),
            controller: controller.confirmPassword,
          ),
          CustomElevatedButton(
            text: "비밀번호 변경 완료",
            onPressed: () {
              // if (_formkey.currentState!.validate()) {
              //   controller.signupFetchData();
              // } else {
              //   Get.snackbar("회원가입 시도", "회원가입 실패");
              // }
            },
          ),
        ],
      ),
    );
  }
}
