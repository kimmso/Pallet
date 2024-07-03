import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/feed.dart';
import 'package:flutter_getx_palette_diary/src/view/info_modify.dart';
import 'package:flutter_getx_palette_diary/src/view/my_detail_page.dart';

import 'package:get/get.dart';
import 'package:flutter_getx_palette_diary/src/controller/myprofil_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/myprofil.dart';
import 'package:flutter_getx_palette_diary/src/repository/myprofil_repository.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.binding}) : super(key: key);

  final BindingsBuilder binding;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<MyProfil?> _myprofilFuture;
  final MyProfilController myprofilController =
      Get.put(MyProfilController(repository: MyProfilRepository()));

  @override
  void initState() {
    super.initState();
    _myprofilFuture = myprofilController.myinfofetchData();
  }

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
        actions: [_profilmenu()],
      ),
      body: FutureBuilder<MyProfil?>(
        future: _myprofilFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('프로필 로드 중 오류 발생'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('프로필 데이터 없음'));
          } else {
            MyProfil profile = snapshot.data!;
            return GetBuilder<MyProfilController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileBox(context, profile),
                        const SizedBox(height: 20),
                        _postcount(profile),
                        const SizedBox(height: 20),
                        _myfeed(profile.myPost), // myPost 리스트를 전달
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _profileBox(BuildContext context, MyProfil profile) {
    double size = 100; // 고정된 크기 설정
    UserController controller = Get.find<UserController>();

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
                  width: size,
                  height: size,
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
        Container(
          width: 200, // 고정된 너비 설정
          child: _miniinfo(profile),
        ),
      ],
    );
  }

  Widget _miniinfo(MyProfil profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${profile.name}',
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          '${profile.id}',
          style: const TextStyle(fontSize: 17.0),
        ),
      ],
    );
  }

  Widget _postcount(MyProfil myprofile) {
    return Center(
      child: Container(
        width: 400, // 고정된 너비 설정
        height: 78,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // const Icon(Icons.edit),
                const Text('내가 쓴 글'),
                Text(
                  myprofile.total_post_count.toString(),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            // const Spacer(), // 요소 사이의 간격을 균등하게 조정
            Container(
              height: 40,
              width: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 30,
            ),
            // const Spacer(), // 요소 사이의 간격을 균등하게 조정
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.favorite,
                //   color: Colors.red,
                const Text('좋아요 수'),

                Text(myprofile.total_like_count.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myfeed(List<Feed> myPost) {
    return Container(
      height: 400, // 고정된 높이 설정
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: myPost.length,
        itemBuilder: (context, index) {
          Feed feed = myPost[index]; // myPost 리스트에서 Feed 객체 가져오기
          String? photoUrl = feed.photo_url;

          return GestureDetector(
            onTap: () {
              // 원하는 페이지로 이동하는 코드 추가
              Get.to(() => MydetailPage(post_no: feed.post_no!));
            },
            child: Container(
              decoration: BoxDecoration(
                image: photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(photoUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: photoUrl == null ? Colors.grey : null,
              ),
              child: photoUrl == null
                  ? const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _profilmenu() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.settings_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text('정보 수정하기'),
                    ],
                  ),
                  onTap: () => _showPasswordBottomSheet(context),
                ),
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(width: 8),
                      Text('로그아웃'),
                    ],
                  ),
                  onTap: () => {Get.find<UserController>().logoutfetchData()},
                ),
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.warning_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text('탈퇴하기'),
                    ],
                  ),
                  onTap: () => {},
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
            offset: const Offset(0, 50),
            color: Colors.white, // 메뉴 배경색 변경
          ),
        ],
      ),
    );
  }

  void _showPasswordBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _passwordController = TextEditingController();
    UserController controller = Get.find<UserController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '비밀번호 입력',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    }
                    // 이 부분에 실제 사용자 비밀번호와 비교 로직을 넣어야 합니다.
                    // 예시로 사용자 컨트롤러의 비밀번호를 가져와 비교합니다.
                    String correctPassword = controller.password.text;
                    if (value != correctPassword) {
                      return '비밀번호가 틀립니다.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('취소'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          Get.to(() => const InfoModifyPage());
                        }
                      },
                      child: const Text('확인'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
