import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/myprofil.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class MyProfilRepository {
  final dio = Dio();

  Future<MyProfil?> myinfoApi() async {
    try {
      String? accessToken = GetStorage().read('accessToken');
      print(accessToken);
      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      print(1111);

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
}
