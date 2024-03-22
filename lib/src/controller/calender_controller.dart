import 'package:flutter_getx_palette_diary/src/model/calenderdate.dart';
import 'package:flutter_getx_palette_diary/src/repository/calender_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalenderDateController extends GetxController {
  var profileImagePath = ''.obs;
  final Rx<List<CalenderDate>> _calenderdates = Rx<List<CalenderDate>>([]);

  List<CalenderDate> get calenderdates => _calenderdates.value;
  final CalenderDateRepository repository;
  CalenderDateController({
    required this.repository,
  });

  Future<List<CalenderDate>?> calenderdateFetchData(String targetTime) async {
    try {
      final calenderdate =
          await repository.calenderdateApi(targetTime); // 비동기 작업을 기다림
      _calenderdates.value = calenderdate ?? [];

      return calenderdate;
    } catch (e) {
      // Dio 오류 또는 다른 예외 처리
      print('calender 정보를 가져오는 도중 오류가 발생했습니다: $e');
      throw Exception();
    }
  }

  // 데이터가 있는지를 시뮬레이션하기 위한 간단한 맵
//   final Map<DateTime, bool> simulatedData = {
//     DateTime(2024, 3, 14): true,
//   };

// // 특정 날짜에 데이터가 있는지 확인하는 함수
//   bool checkIfDataExistsForDate(DateTime date) {
//     // 시뮬레이션된 데이터 맵에서 해당 날짜를 키로 가진 값이 있는지 확인
//     return simulatedData[date] ?? false; // 해당 날짜가 없으면 기본값으로 false 반환
//   }
}
