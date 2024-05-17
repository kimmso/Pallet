import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/calender_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/calenderdate.dart';
import 'package:flutter_getx_palette_diary/src/repository/calender_repository.dart';
import 'package:flutter_getx_palette_diary/src/utils/data_utils.dart';
import 'package:flutter_getx_palette_diary/src/view/my_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends StatefulWidget {
  final Function(PageController) onCalendarCreated;
  final Function(DateTime?) onCalendarDaySelected;
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
  late CalenderDateController _controller;
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  String? create_date;
  String targetTime = DateFormat('yyyy-MM').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.focusMonth;
    _controller =
        Get.put(CalenderDateController(repository: CalenderDateRepository()));
    _controller.calenderdateFetchData(targetTime);
  }

  @override
  Widget build(BuildContext context) {
    return _buildCalendar();
  }

  Widget _buildCalendar() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            List<CalenderDate>? calenderdates = _controller.calenderdates;
            if (calenderdates == null) {
              return CircularProgressIndicator();
            } else {
              return TableCalendar(
                headerVisible: true,
                headerStyle: customHeaderStyle,
                locale: 'ko_KR',
                firstDay: DateTime(DateTime.now().year, 1, 1),
                lastDay: DateTime(DateTime.now().year + 2, 1, 1),
                focusedDay: _focusedDay ?? DateTime.now(),
                calendarFormat: CalendarFormat.month,
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF4DA9FF),
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onPageChanged: (focusedDay) {
                  // 이전 달로 넘어갈 때 작업을 수행합니다.
                  print('이전 달로 넘어갔습니다: $focusedDay');
                  _focusedDay = focusedDay; // _focusedDay 업데이트

                  String targetTime = DateFormat('yyyy-MM').format(focusedDay);
                  _controller.calenderdateFetchData(targetTime);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  bool hasData = calenderdates.any((date) => isSameDay(
                      selectedDay, DateTime.parse(date.create_date!)));

                  if (hasData) {
                    Get.to(() => MyPage(selectedDate: selectedDay));
                    widget.onCalendarDaySelected(selectedDay);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('알림'),
                        content: const Text('해당 날짜에는 데이터가 없습니다.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('확인'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, date) {
                    return _dowHeaderStyle(
                      date: TodoDataUtils.convertWeekdayToStringValue(
                          date.weekday),
                      color: TodoDataUtils.dayToColor(date),
                    );
                  },
                  defaultBuilder: (context, date, _) => _dayStyle(
                    date: date,
                    color: TodoDataUtils.dayToColor(date),
                    isToday: false,
                    imagePath: TodoDataUtils.getImagePathForDate(date),
                  ),
                  outsideBuilder: (context, date, _) => _dayStyle(
                    date: date,
                    color: TodoDataUtils.dayToColor(date, opacity: 0.3),
                  ),
                  markerBuilder: (context, day, events) {
                    bool hasData = calenderdates.any((date) =>
                        isSameDay(day, DateTime.parse(date.create_date!)));

                    if (hasData) {
                      return Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                onCalendarCreated: widget.onCalendarCreated,
                onFormatChanged: (format) {},
              );
            }
          }),
        ],
      ),
    );
  }

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

  Widget _dayStyle({
    required DateTime date,
    Color? color,
    bool isToday = false,
    bool isSelected = false,
    String? imagePath,
  }) {
    var backgroundColor = Colors.white;
    if (isToday) backgroundColor = const Color(0xffbebfc7);
    if (isSelected) backgroundColor = const Color(0xff4a69ea);
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
                : Container(),
          ),
          Center(
            child: Text(
              '${date.day}',
              style: GoogleFonts.notoSans(
                  color: isToday ? Colors.white : color, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

HeaderStyle customHeaderStyle = const HeaderStyle(
  formatButtonVisible: false,
  titleCentered: true,
);
