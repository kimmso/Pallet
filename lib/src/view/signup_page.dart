import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/email_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';
import 'package:flutter_getx_palette_diary/src/view/login_page.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<UserController> {
  String? authcode; // authcode를 상태로 저장

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController emailController =
        Get.find(); // EmailController 인스턴스 가져오기
    final TextEditingController authcodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => LoginPage());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                '회원가입',
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 132, 211),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _signUpForm(emailController, authcodeController)
          ],
        ),
      ),
    );
  }

  Widget _signUpForm(EmailController emailController,
      TextEditingController authcodeController) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextField(
            hint: "이름",
            controller: controller.name,
            validator: (String) {},
          ),
          CustomTextField(
            hint: "이메일",
            validator: ValidatorUtil.validateEmail,
            controller: controller.signupId,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextButton(
                child: const Text('인증하기'),
                onPressed: () async {
                  try {
                    authcode = await emailController
                        .authFetchData(controller.signupId.text);

                    Get.snackbar(
                      "인증메일 전송",
                      "인증메일이 성공적으로 전송되었습니다.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Color.fromARGB(255, 129, 132, 211),
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    Get.snackbar(
                      "오류",
                      "인증메일 전송에 실패했습니다. 다시 시도해 주세요.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
          CustomTextField(
            hint: "이메일 인증번호",
            controller: authcodeController,
            validator: ValidatorUtil.validateConfirmCode,
            suffixIcon: Padding(
              padding: EdgeInsets.all(6.0),
              child: TextButton(
                  onPressed: () {
                    final inputCode = authcodeController.text;

                    // 사용자가 입력한 코드와 전달받은 코드 비교
                    if (inputCode == authcode) {
                      Get.snackbar(
                        "인증 성공",
                        "인증번호가 확인되었습니다.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Color.fromARGB(255, 129, 132, 211),
                        colorText: Colors.white,
                      );
                    } else {
                      Get.snackbar(
                        "인증 실패",
                        "입력한 인증번호가 올바르지 않습니다.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Text('확인')),
            ),
          ),
          CustomTextField(
            hint: "비밀번호",
            validator: ValidatorUtil.validatePassword,
            controller: controller.signupPassword,
          ),
          CustomTextField(
            hint: "비밀번호 확인",
            validator: (value) => ValidatorUtil.validateConfirmPassword(
                value, controller.confirmPassword.text),
            controller: controller.confirmPassword,
          ),
          CustomElevatedButton(
            text: "회원가입",
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                controller.signupFetchData();
              } else {
                Get.snackbar("회원가입 시도", "회원가입 실패");
              }
            },
          ),
        ],
      ),
    );
  }
}
