import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';
import 'package:flutter_getx_palette_diary/src/widget/home_calendar.dart';
import 'package:flutter_getx_palette_diary/src/widget/home_fab.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'PALETTE', // 앱의 타이틀
            style: TextStyle(
              fontFamily: 'NanumGothic', // 타이틀의 폰트 설정
              fontWeight: FontWeight.bold, // 타이틀의 글꼴 두껍게 설정
            ),
          ),
          leading: SizedBox.shrink(), // 뒤로가기 버튼 없애기
        ),
        body: _body(), // 화면의 주요 내용을 담은 위젯
        floatingActionButton:
            HomeFab(onPressed: controller.handleFabPress), // FAB 버튼
      ),
    );
  }

  // 화면의 주요 내용을 담은 위젯
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const SizedBox(
          //   height: 100,
          // ),
          _calendalWidget(), // 달력 위젯

          // if (controller.isDateSelected.value)
          //   _cardWidget(), // 선택된 날짜에 대한 카드 위젯
        ],
      ),
    );
  }

  // 달력 위젯
  Widget _calendalWidget() {
    return SizedBox(
      key: controller.calendarKey, // 달력 위젯의 고유 키
      height: 350, // 달력 위젯의 높이
      child: SingleChildScrollView(
        child: Center(
          child: HomeCalendar(
            focusMonth: controller.headerDate.value, // 달력의 초기 표시 월
            onCalendarCreated:
                controller.onCalendarCreated, // 달력이 생성될 때 호출되는 콜백 함수
            onCalendarDaySelected: (selectedDay) {
              controller
                  .updateSelectedDay(selectedDay); // 사용자가 날짜를 선택했을 때 호출되는 콜백 함수
            },
          ),
        ),
      ),
    );
  }

  // 선택된 날짜에 대한 카드 위젯
  // Widget _cardWidget() {
  //   DateTime? selectedDate = controller.selectedDay.value; // 선택된 날짜
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간
  //       height: controller.isDateSelected.value ? 220 : 0, // 카드 위젯의 높이
  //       decoration: BoxDecoration(
  //         // color: Color.fromARGB(255, 174, 177, 240), // 카드의 배경색
  //         borderRadius: BorderRadius.circular(20), // 모서리를 둥글게 설정
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           // 이미지를 넣을 부분
  //           Container(
  //             width: double.infinity, // 카드의 가로 전체를 사용
  //             height: controller.isDateSelected.value
  //                 ? 220
  //                 : 0, // 카드의 높이와 동일하게 설정 (이미지 크기 조정 가능)
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20), // 모서리를 둥글게 설정
  //               image: DecorationImage(
  //                 image: NetworkImage(
  //                   'https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/pallet_post/soyeon@naver.com/679966.jpg',
  //                 ),
  //                 fit: BoxFit.contain, // 이미지를 카드에 맞춰서 보여주도록 설정
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
