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

  Future<MyProfil?> myinfofetchData() async {
    final myprofil = await repository.myinfoApi();
    if (myprofil != null) {
      _myprofils.value = myprofil;
      print(myprofil);
      return myprofil;
    } else {
      print(222);
    }
  }
}
