import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/view/change_password.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:get/get.dart';

class GetNumberPage extends StatelessWidget {
  const GetNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '인증번호', // TextField에 레이블을 추가합니다.
                  ),
                ),
                const SizedBox(height: 20), // TextField와 버튼 사이에 간격을 추가합니다.
                CustomElevatedButton(
                  text: "확인",
                  onPressed: () {
                    Get.to(() => const ChangePasswordPage());
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
