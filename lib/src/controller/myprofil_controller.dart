import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/myprofil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repository/myprofil_repository.dart';

class MyProfilController extends GetxController {
  final Rxn<MyProfil> _myprofils = Rxn<MyProfil>();

  final MyProfilRepository repository;
  MyProfilController({
    required this.repository,
  });
  Future<MyProfil?> myinfoFetchData() async {
    print(1234);
    try {
      print(999);
      // repository.myinfoApi()가 Future<User?>를 반환하므로 await을 사용하여 비동기 호출
      repository.myinfoApi().then((myprofil) async {
        print(77);
        _myprofils.value = myprofil;

        print(myprofil);

        return myprofil;
      });
    } catch (e) {
      // Dio 오류 또는 다른 예외 처리
      print('User 정보를 가져오는 도중 오류가 발생했습니다: $e');
      return null;
    }
  }
}
