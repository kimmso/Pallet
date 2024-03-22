import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/calenderdate.dart';

import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class CalenderDateRepository {
  final dio = Dio();

  Future<List<CalenderDate>?> calenderdateApi(String targetTime) async {
    try {
      String dateUrl = "${ApiUrls.dateUrl}/$targetTime";

      String? accessToken = GetStorage().read('accessToken');
      // dio.options.contentType = 'application/json';

      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      final response = await dio.get(dateUrl);

      if (response.statusCode == 200) {
        List<CalenderDate> calenderdates = [];

        if (response.data is List) {
          if (response.data.isNotEmpty) {
            for (var data in response.data) {
              final calenderdate = CalenderDate.fromJson(data);

              calenderdates.add(calenderdate);
            }
          } else {
            print('response.data is empty');
          }
        } else {
          print('response.data is not a list');
        }

        return calenderdates;
      } else {
        throw Exception();
      }
    } catch (e) {
      print('Error occurred while fetching post list: $e'); // 에러 메시지 출력
      throw Exception('Failed to fetch post list: $e');
    }
  }

  Future<void> putCalenderDates(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.dateUrl, data: json).then((response) {
        //print(response.statusCode);
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return CalenderDate.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
