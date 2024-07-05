import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/myprofil.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:flutter_getx_palette_diary/src/utils/dio_interceptor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyProfilRepository {
  final dio = Dio()..interceptors.add(BaseInterceptor());

  Future<MyProfil?> myinfoApi() async {
    try {
      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      final response = await dio.get(ApiUrls.myinfoUrl);

      if (response.statusCode == 200) {
        print(response.statusCode);
        return MyProfil.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> nicknameApi(Map<String, dynamic> json) async {
    try {
      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      final response = await dio.patch(ApiUrls.nicknameUrl, data: json);

      if (response.statusCode == 200) {
      } else {
        Get.snackbar('실패', '실패');

        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> passwordApi(Map<String, dynamic> json) async {
    try {
      String? accessToken = GetStorage().read('accessToken');

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      final response = await dio.patch(ApiUrls.passwordUrl, data: json);

      if (response.statusCode == 200) {
      } else {
        Get.snackbar('실패', '실패');

        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
