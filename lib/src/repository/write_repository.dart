import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/utils/api_url.dart';

import '../model/write.dart';

class WriteRepository {
  final dio = Dio();

  Future<Write?> writeApi(Map<String, dynamic> json) async {
    try {
      print(json);
      return dio.post(ApiUrls.loginUrl, data: json).then((response) {
        print(response.statusCode);
        print(response.data);
        if (response.statusCode == 200) {
          return Write.fromJson(response.data);
        } else {
          return null;
        }
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putUsers(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.writeUrl, data: json).then((response) {
        print(response.statusCode);
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return Write.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
