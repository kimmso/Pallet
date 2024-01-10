import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/view/my_page.dart';

import 'package:get/get.dart';

import '../binding/init_binding.dart';
import '../model/write.dart';
import '../repository/write_repository.dart';

class WriteController extends GetxController {
  final Rxn<Write> _writes = Rxn<Write>();

  final TextEditingController _content = TextEditingController();

  final WriteRepository repository;
  WriteController({
    required this.repository,
  });

  TextEditingController get content => _content;

  void fetchData() {
    final write = {
      'content': content.text.toString(),
    };

    repository.writeApi(write).then((user) {
      _writes.value = user;
      Get.to(() => const MyPage());
    });
  }

  void putData() {
    final write = {
      'content': content.text.toString(),
    };
    repository.putUsers(write);
  }

// 화면 크기별 위젯 능동적 조정
  late double screenWidth = 0.0;
  late double screenHeight = 0.0;

  void initScreenWidth(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  void moveToRegister() {
    Get.to(() => MyPage(), binding: InitBinding());
  }

  void moveToApp() {
    Get.to(() => const Home());
  }
}
