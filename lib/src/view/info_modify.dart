import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/password.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class InfoModifyPage extends GetView<UserController> {
  const InfoModifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('정보 수정하기'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller.name,
                  hint: "이름",
                  validator: (value) =>
                      ValidatorUtil.validateName(controller.name.value.text),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  text: "이름 수정 완료하기",
                  onPressed: () {
                    // if (_formkey.currentState!.validate()) {
                    //   controller.fetchData();
                    // } else {
                    //   Get.snackbar("로그인 시도", "로그인 실패");
                    // }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => PasswordPage());
                  },
                  child: const Text(
                    "비밀번호를 변경하시겠습니까?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
