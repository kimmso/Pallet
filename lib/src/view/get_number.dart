import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/email_controller.dart';
import 'package:flutter_getx_palette_diary/src/view/change_password.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:get/get.dart';

class GetNumberPage extends GetView<EmailController> {
  final String code;
  const GetNumberPage({required this.code, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('인증번호 입력'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0), // 패딩을 추가하여 여백을 줍니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Column의 정렬을 시작점으로 설정합니다.
              children: [
                const Text(
                  '인증번호를 입력하세요.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10), // Text와 TextField 사이에 간격을 추가합니다.
                TextField(
                  controller: codeController, // 사용자 입력을 받을 컨트롤러
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '인증번호', // TextField에 레이블을 추가합니다.
                  ),
                ),
                const SizedBox(height: 20), // TextField와 버튼 사이에 간격을 추가합니다.
                CustomElevatedButton(
                  text: "확인",
                  onPressed: () {
                    print("넘긴 코드");
                    print(code);
                    final inputCode = codeController.text;
                    print(inputCode);
                    // 사용자가 입력한 코드와 전달받은 코드 비교
                    if (inputCode == code) {
                      print("성공?");
                      Get.to(() => const ChangePasswordPage());
                    } else {
                      // 코드가 일치하지 않을 때 사용자에게 알림
                      Get.snackbar(
                        '오류',
                        '입력한 인증번호가 올바르지 않습니다.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
