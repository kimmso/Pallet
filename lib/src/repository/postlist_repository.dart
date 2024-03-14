import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/postlist.dart';

import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class PostListRepository {
  final dio = Dio();

  Future<List<PostList>?> postlistApi(String targetTime) async {
    try {
      String postlistUrl = "${ApiUrls.mypostUrl}$targetTime";

      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.get(postlistUrl);

      if (response.statusCode == 200) {
        List<PostList> postlists = [];

        for (var data in response.data) {
          print(1);
          final postlist = PostList.fromJson(data);
          print(2);
          postlists.add(postlist);
        }

        return postlists;
      } else {
        print(3);
        throw Exception();
      }
    } catch (e) {
      print(4);
      throw Exception();
    }
  }

  Future<void> putPostLists(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.mypostUrl, data: json).then((response) {
        //print(response.statusCode);
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return PostList.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
