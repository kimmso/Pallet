import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/postlist.dart';

import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class PostListRepository {
  final dio = Dio();

  Future<List<PostList>?> postlistApi(String targetTime) async {
    try {
      String postlistUrl = "${ApiUrls.mypostUrl}/$targetTime";

      String? accessToken = GetStorage().read('accessToken');
      // dio.options.contentType = 'application/json';

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.get(postlistUrl);

      if (response.statusCode == 200) {
        List<PostList> postlists = [];

        if (response.data is List) {
          if (response.data.isNotEmpty) {
            for (var data in response.data) {
              final postlist = PostList.fromJson(data);

              postlists.add(postlist);
            }
          } else {
            print('response.data is empty');
          }
        } else {
          print('response.data is not a list');
        }

        return postlists;
      } else {
        print(3);
        throw Exception();
      }
    } catch (e) {
      print('Error occurred while fetching post list: $e'); // 에러 메시지 출력
      throw Exception('Failed to fetch post list: $e');
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

  Future<void> deleteApi(int post_no) async {
    try {
      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      String deleteUrl = "${ApiUrls.postUrl}/${post_no}";

      final response = await dio.delete(deleteUrl);
      print(deleteUrl);

      if (response.statusCode == 200) {
      } else if (response.statusCode == 400) {
        final errorMessage = response.data['error'];
        print("삭제하기 실패: $errorMessage");
      } else {
        throw Exception("삭제하기 오류");
      }
    } catch (e) {
      print("Error in deleteApi: $e");
      throw Exception("삭제하기 중 오류 발생");
    }
  }
}
