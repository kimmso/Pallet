import 'dart:ffi';

import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/repository/detail_repository.dart';
import 'package:flutter_getx_palette_diary/src/repository/like_repository.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final Rxn<FeedDetail> feeddetails = Rxn<FeedDetail>();
  var isLiked = false.obs;

  final LikeRepository repository;
  LikeController({
    required this.repository,
  });

  Future<Void?> pluslikefetchData(int post_no) async {
    bool? response = await repository.likeApi(post_no);
    if (response == true) {
      isLiked.value = true; // 좋아요 상태 변경
    } else {
      print(222);
    }
  }

  Future<Void?> minuslikefetchData(int post_no) async {
    bool? response = await repository.minuslikeApi(post_no);
    if (response == true) {
      isLiked.value = false; // 좋아요 상태 변경
    } else {
      print(222);
    }
  }
}
