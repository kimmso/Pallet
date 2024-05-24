import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/view/profile_modify.dart';
import 'package:get/get.dart';

class Profile extends GetView<UserController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '나의 프로필',
          style: TextStyle(
            fontFamily: 'NanumGothic',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _profileBox(context),
        _profileInformation(),
      ],
    );
  }

  Widget _profileBox(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.25;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            Obx(() {
              return ClipOval(
                child: controller.isProfileImageSet
                    ? Image.file(
                        File(controller.profileImagePath.value),
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey,
                        width: 80,
                        height: 80,
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
              );
            }),
            const SizedBox(width: 14.0),
            _miniinfo(),
          ],
        ),
      ),
    );
  }

  Widget _miniinfo() {
    controller.myinfoFetchData();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ' ${controller.readName()}',
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            ' ${controller.readId()}',
            style: const TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
    // } else {
    //   return Text('사용자 정보를 불러올 수 없습니다.');
    // }
  }
}
// }

Widget _profileInformation() {
  final UserController controller = Get.find(); // 컨트롤러 인스턴스 가져오기

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: GestureDetector(
                onTap: () {
                  // controller.pfmgo(controller);
                },
                child: TextButton(
                    onPressed: () {
                      Get.to(() => ProfileModify);
                    },
                    child: const Text(
                      '내 프로필 수정하기',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ))),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            child: TextButton(
              onPressed: () {
                controller.logoutfetchData();
                // Get.to(() => LoginPage());
                print('로그아웃 성공');
              },
              child: const Row(
                children: [
                  Icon(Icons.logout, color: Colors.black), // 로그아웃 아이콘
                  SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조절
                  Text(
                    '로그아웃',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
