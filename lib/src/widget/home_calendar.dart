import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/utils/data_utils.dart';
import 'package:flutter_getx_palette_diary/src/view/my_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends StatefulWidget {
  // 달력이 생성될 때와 사용자가 새로운 날짜를 선택할 때 호출되는 콜백 함수들
  final Function(PageController) onCalendarCreated;
  final Function(DateTime?) onCalendarDaySelected;
  // 초기에 달력에 표시될 월
  final DateTime focusMonth;

  const HomeCalendar({
    Key? key,
    required this.focusMonth,
    required this.onCalendarCreated,
    required this.onCalendarDaySelected,
  }) : super(key: key);

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  DateTime? _selectedDay; // 사용자가 선택한 날짜
  DateTime? _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.focusMonth; // 초기 선택된 날짜를 focusMonth로 설정
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // 캘린더를 가운데로 배치
      child: Column(
        // 위아래로 위젯을 배치하기 위해 Column 사용
        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
        children: [
          TableCalendar(
            headerVisible: true,
            headerStyle: customHeaderStyle, // 사용자 정의 헤더 스타일
            locale: 'ko_KR', // 달력 언어 설정
            firstDay: DateTime(DateTime.now().year, 1, 1), // 달력의 첫 번째 날짜
            lastDay: DateTime(DateTime.now().year + 2, 1, 1), // 달력의 마지막 날짜
            focusedDay: _focusedDay ?? DateTime.now(), // 초기에 달력이 포커스할 날짜
            calendarFormat: CalendarFormat.month, // 달력 형식 (월별)
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.red, // 선택된 날짜의 배경색
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Color(0xFF4DA9FF), // 오늘 날짜의 배경색
                shape: BoxShape.circle,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day); // 선택된 날짜와 현재 날짜가 같은지 확인
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay; // 선택된 날짜 업데이트
                  _focusedDay = focusedDay; // 포커스된 날짜 업데이트
                });

                Get.to(() => MyPage(selectedDate: selectedDay));

                widget.onCalendarDaySelected(selectedDay); // 선택한 날짜에 대한 콜백 호출
              }
            },
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, date) {
                return _dowHeaderStyle(
                  date: TodoDataUtils.convertWeekdayToStringValue(
                      date.weekday), // 요일 텍스트 설정
                  color: TodoDataUtils.dayToColor(date), // 요일 색상 설정
                );
              },
              defaultBuilder: (context, date, _) => _dayStyle(
                date: date, // 날짜
                color: TodoDataUtils.dayToColor(date), // 날짜 텍스트 색상
                isToday: false, // 오늘 날짜 여부
                imagePath:
                    TodoDataUtils.getImagePathForDate(date), // 날짜에 해당하는 이미지 경로
              ),
              outsideBuilder: (context, date, _) => _dayStyle(
                date: date,
                color: TodoDataUtils.dayToColor(date,
                    opacity: 0.3), // 투명도 조절하여 날짜 텍스트 색상 설정
              ),
            ),
            onCalendarCreated: widget.onCalendarCreated,
            onFormatChanged: (format) {},
          ),
        ],
      ),
    );
  }

  // 달력 요일 텍스트 스타일링
  Widget _dowHeaderStyle({required String date, required Color color}) {
    return Center(
      child: SizedBox(
        height: 30,
        child: Text(
          date,
          style: GoogleFonts.notoSans(color: color, fontSize: 13),
        ),
      ),
    );
  }

  // 달력 날짜 스타일링
  Widget _dayStyle({
    required DateTime date,
    Color? color,
    bool isToday = false,
    bool isSelected = false,
    String? imagePath,
  }) {
    var backgroundColor = Colors.white;
    if (isToday) backgroundColor = const Color(0xffbebfc7); // 오늘 날짜 배경색
    if (isSelected) backgroundColor = const Color(0xff4a69ea); // 선택된 날짜 배경색
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                : Container(), // 날짜에 이미지가 있는 경우 이미지 표시
          ),
          Center(
            child: Text(
              '${date.day}', // 날짜 텍스트
              style: GoogleFonts.notoSans(
                  color: isToday ? Colors.white : color,
                  fontSize: 18), // 날짜 텍스트 스타일
            ),
          ),
        ],
      ),
    );
  }
}

// 사용자 정의 헤더 스타일
HeaderStyle customHeaderStyle = const HeaderStyle(
  formatButtonVisible: false,
  titleCentered: true,
);
