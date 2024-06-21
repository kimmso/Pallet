import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_palette_diary/src/controller/myprofil_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/myprofil.dart';
import 'package:flutter_getx_palette_diary/src/repository/myprofil_repository.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.binding}) : super(key: key);

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
    _myprofilFuture = myprofilController.myinfoFetchData();
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
                        _myfeed(),
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
    double size = MediaQuery.of(context).size.width * 0.25;
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
        _miniinfo(profile),
      ],
    );
  }

  Widget _miniinfo(MyProfil profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'profile.name',
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          'profile.id',
          style: const TextStyle(fontSize: 17.0),
        ),
      ],
    );
  }

  Widget _postcount(MyProfil myprofile) {
    return Center(
      child: Container(
        width: 300,
        height: 70,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myprofile.total_post_count.toString(),
            ),
            const SizedBox(width: 20),
            Container(
              height: 30,
              width: 1,
              color: Colors.grey,
            ),
            const SizedBox(width: 20),
            Text(myprofile.total_like_count.toString()),
          ],
        ),
      ),
    );
  }

  Widget _myfeed() {
    return Container(
      height: 400,
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
