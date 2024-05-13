import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/user.dart';
import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:flutter_getx_palette_diary/src/view/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository {
  final dio = Dio();

  Future<User?> loginApi(Map<String, dynamic> json) async {
    try {
      return dio.post(ApiUrls.loginUrl, data: json).then((response) {
        // print(response.statusCode);
        // print(response.data);
        if (response.statusCode == 200) {
          String? accessToken = response.data['accessToken'];
          GetStorage().write('accessToken', accessToken);
          print("저장한 토큰 : $accessToken");
          return User.fromJson(response.data);
        } else if (response.statusCode == 400) {
          final errorMessage = response.data['error'];
          print("로그인 실패: $errorMessage");
          return null;
        } else {
          throw Exception("잘못된 비밀번호");
        }
      }).catchError((error) {
        print("loginApi에서 Dio 오류: $error");
        throw Exception("로그인 중 오류 발생");
      });
    } catch (e) {
      print("Error in loginApi: $e");
      throw Exception("로그인 중 오류 발생");
    }
  }

  Future<void> putUsers(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.loginUrl, data: json).then((response) {
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> signupApi(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(ApiUrls.signupUrl, data: json);

      if (response.statusCode == 201) {
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("회원가입 실패", "아이디가 중복되었습니다.");

      throw Exception();
    }
  }

  Future<void> putSignups(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.signupUrl, data: json).then((response) {
        if (response.statusCode == 201) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> myinfoApi() async {
    try {
      String? accessToken = GetStorage().read('accessToken');
      print(accessToken);
      dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.get(ApiUrls.myinfoUrl);

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putMyinfos(Map<String, dynamic> json) async {
    try {
      dio.put(ApiUrls.myinfoUrl, data: json).then((response) {
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> logoutApi() async {
    try {
      String? accessToken = GetStorage().read('accessToken');
      dio.options.headers = {'Authorization': 'Bearer $accessToken'};

      final response = await dio.delete(ApiUrls.logoutUrl);

      if (response.statusCode == 200) {
        Get.to(() => LoginPage());
      } else {
        print("로그아웃 실패");
        Get.snackbar("로그아웃 실패", "다시 시도해주세요.");
        throw Exception("로그아웃 중 오류 발생");
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
