import 'package:flutter_getx_palette_diary/src/model/postlist.dart';
import 'package:flutter_getx_palette_diary/src/repository/postlist_repository.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  final Rx<List<PostList>> _postlists = Rx<List<PostList>>([]);

  var profileImagePath = ''.obs;
  List<PostList> get postlists => _postlists.value;
  final PostListRepository repository;
  PostListController({
    required this.repository,
  });

  Future<List<PostList>?> postlistFetchData(String targetTime) async {
    try {
      final postlist = await repository.postlistApi(targetTime); // 비동기 작업을 기다림
      _postlists.value = postlists;

      return postlist;
    } catch (e) {
      // Dio 오류 또는 다른 예외 처리
      print('User 정보를 가져오는 도중 오류가 발생했습니다: $e');
      throw Exception();
    }
  }
}
