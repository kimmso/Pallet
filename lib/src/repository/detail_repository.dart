import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class DetailRepository {
  final dio = Dio();
  Future<FeedDetail?> detailApi(int post_no) async {
    try {
      dio.options.contentType = 'application/json';

      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      String detailUrl = "${ApiUrls.detailUrl}/${post_no}";
      print(detailUrl);
      final response = await dio.get(detailUrl);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return FeedDetail.fromJson(response.data);
      } else {
        print("글 불러오기 실패");
        print(response.data);
        return null;
      }
    } catch (error) {
      // DioError인 경우
      if (error is DioError) {
        // 에러 타입에 따라 처리
        if (error.response != null) {
          print('Response error: ${error.response}');
        } else {
          print('Connection error: $error');
        }
      } else {
        print('Non-DioError: $error');
      }
    }
  }
}
