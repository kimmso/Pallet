import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/repository/like_repository.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final Rxn<FeedDetail> feeddetails = Rxn<FeedDetail>();
  var isLiked = false.obs;
  var like_count = 0.obs; // RxInt를 사용하여 좋아요 숫자를 관리합니다.

  final LikeRepository repository;
  LikeController({
    required this.repository,
  });

  Future<void> pluslikefetchData(int post_no) async {
    bool? response = await repository.likeApi(post_no);
    if (response == true) {
      isLiked.value = true; // 좋아요 상태 변경
      like_count.value++; // 좋아요 숫자 1 증가
    } else {
      print("플러스 실패");
    }
  }

  Future<void> minuslikefetchData(int post_no) async {
    bool? response = await repository.minuslikeApi(post_no);
    if (response == true) {
      isLiked.value = false; // 좋아요 상태 변경
      if (like_count.value > 0) {
        like_count.value--; // 좋아요 숫자 1 감소 (0 미만으로 가지 않도록 체크)
      }
    } else {
      print('마이너스 실패');
    }
  }
}
