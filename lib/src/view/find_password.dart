import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/view/get_number.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:get/get.dart';

class FindPasswordPage extends StatelessWidget {
  const FindPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('비밀번호 찾기'),
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
                '이메일을 입력해주세요.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10), // Text와 TextField 사이에 간격을 추가합니다.
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일', // TextField에 레이블을 추가합니다.
                ),
                keyboardType:
                    TextInputType.emailAddress, // 이메일 입력을 위한 키보드 타입을 설정합니다.
              ),
              const SizedBox(height: 20), // TextField와 버튼 사이에 간격을 추가합니다.
              CustomElevatedButton(
                text: "확인",
                onPressed: () {
                  Get.to(() => const GetNumberPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
