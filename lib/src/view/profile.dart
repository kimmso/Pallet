import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.find<UserController>().logoutfetchData();
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
      body: GetBuilder<UserController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _profileBox(context, controller),
                  const SizedBox(
                    height: 20,
                  ),
                  _postcount(controller),
                  const SizedBox(
                    height: 20,
                  ),
                  _myfeed(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _profileBox(BuildContext context, UserController controller) {
    double size = MediaQuery.of(context).size.width * 0.25;

    return Row(
      children: <Widget>[
        ClipOval(
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
        ),
        const SizedBox(width: 14.0),
        _miniinfo(controller),
      ],
    );
  }

  Widget _miniinfo(UserController controller) {
    return Column(
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
    );
  }

  Widget _postcount(UserController controller) {
    return Center(
      child: Container(
        width: 300,
        height: 70, // 높이를 설정
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '총 작성한 글',
            ),
            const SizedBox(width: 20), // 텍스트 사이에 간격 추가
            Container(
              height: 30, // 선의 높이
              width: 1, // 선의 너비
              color: Colors.grey, // 선의 색상
            ),
            const SizedBox(width: 20), // 선과 텍스트 사이에 간격 추가
            const Text('좋아요 수 '),
          ],
        ),
      ),
    );
  }

  Widget _myfeed() {
    return Container(
      height: 400, // GridView가 높이를 가져야 하므로 높이를 지정해야 함
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            color: const Color.fromARGB(255, 239, 199, 246),
          );
        },
      ),
    );
  }
}
