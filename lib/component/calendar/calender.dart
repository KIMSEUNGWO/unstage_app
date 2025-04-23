
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/calendar/calendar_date_helper.dart';
import 'package:unstage_app/component/calendar/date_range.dart';
import 'package:unstage_app/dto/CalendarEvent.dart';
import 'package:unstage_app/pages/component/custom_container.dart';

class CalenderWidget extends StatefulWidget {
  final MonthRange monthRange;

  CalenderWidget({super.key, MonthRange? monthRange}):
    monthRange = monthRange ?? MonthRange();

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {

  late CalendarController _calendarController;
  late DateTime _today;
  late DateTime _selectDate;
  late DateTime _currentMonth;
  final DateTimeHelper calendarHelper = DateTimeHelper();
  late int _previousPage;

  void _preDate() {
    _calendarController.previousPage();
  }
  void _nextDate() {
    _calendarController.nextPage();
  }

  void _onPageChanged(int page) {
    _calendarController.pageChange(page);

    setState(() {
      _currentMonth = _onChange(page);
      _previousPage = page;
    });
  }

  // Calendar 에 표시할 DateTime 를 page 로 조회 하는 메소드
  DateTime _onChange(int page) {
    if (_previousPage < page) {
      return DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    } else if (_previousPage > page) {
      return DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    }
    return _currentMonth;
  }

  @override
  void initState() {
    DateTime now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _currentMonth = DateTime(now.year, now.month, 1);
    _selectDate = DateTime(now.year, now.month, now.day);
    _calendarController = CalendarController(
      range: widget.monthRange,
    );
    _calendarController.init();
    _previousPage = _calendarController.pageController.initialPage;
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _preDate,
              child: Icon(Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: _calendarController.prevDisabled
                    ? const Color(0xFF999999)
                    : const Color(0xFF292929),
              ),
            ),
            const SizedBox(width: 15,),
            Text(DateFormat('yyyy년 MM월').format(_currentMonth),
              style: FontTheme.of(context,
                fontColor: FontColor.f1,
                size: FontSize.displaySmall,
                weight: FontWeight.w500
              ),
            ),
            const SizedBox(width: 15,),
            GestureDetector(
              onTap: _nextDate,
              child: Icon(Icons.arrow_forward_ios_rounded,
                size: 15,
                color: _calendarController.nextDisabled
                  ? const Color(0xFF999999)
                  : const Color(0xFF292929),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        CustomContainer(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            // 명시적인 높이 지정 (최소값)
            height: 400, // 충분히 큰 값으로 설정
            child: PageView.builder(
              controller: _calendarController.pageController,
              onPageChanged: _onPageChanged,
              itemCount: _calendarController.range.maxPage,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  // 내용이 넘치면 스크롤 가능하게
                  child: _Calendar(
                    currentMonth: _onChange(index),
                    today: _today,
                    selectDate: _selectDate,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Calendar extends StatefulWidget {

  final DateTime today;
  final DateTime currentMonth;
  final DateTime selectDate;

  const _Calendar({required this.today, required this.currentMonth, required this.selectDate});

  @override
  State<_Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<_Calendar> with AutomaticKeepAliveClientMixin {
  final List<String> _weeks = ['일', '월', '화', '수', '목', '금', '토'];
  final DateTimeHelper calendarHelper = DateTimeHelper();

  final Map<DateTime, List<CalendarEvent>> _events = {
    DateTime(2025,03,27) : [
      CalendarEvent(title: '11테스트테스트테스트', dateTime: DateTime(2025,03,27,16,30)),
      CalendarEvent(title: '22테스트테스트테스트', dateTime: DateTime(2025,03,27,17,00)),
    ],

    DateTime(2025,03,28) : [
      CalendarEvent(title: '11테스트테스트테스트', dateTime: DateTime(2025,03,28,16,30)),
      CalendarEvent(title: '22테스트테스트테스트', dateTime: DateTime(2025,03,28,17,00)),
      CalendarEvent(title: '33테스트테스트테스트', dateTime: DateTime(2025,03,28,18,00)),
      CalendarEvent(title: '33테스트테스트테스트', dateTime: DateTime(2025,03,28,18,00)),
    ],

    DateTime(2025,02,23) : [
      CalendarEvent(title: '11테스트테스트테스트', dateTime: DateTime(2025,02,23,16,30)),
      CalendarEvent(title: '22테스트테스트테스트', dateTime: DateTime(2025,02,23,17,00)),
    ],

    DateTime(2025,03,23) : [
      CalendarEvent(title: '11테스트테스트테스트', dateTime: DateTime(2025,03,23,16,30)),
      CalendarEvent(title: '22테스트테스트테스트', dateTime: DateTime(2025,03,23,17,00)),
    ],
  };



  @override
  void initState() {
    print('_CalendarState.initState , date : ${widget.currentMonth}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<DateTime> calendar = calendarHelper.generate(widget.currentMonth);

    // 주 단위로 데이터 분할
    List<List<DateTime>> calendarWeeks = [];
    for (int i = 0; i < calendar.length; i += 7) {
      final end = i + 7 > calendar.length ? calendar.length : i + 7;
      calendarWeeks.add(calendar.sublist(i, end));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 요일 헤더
        Table(
          defaultColumnWidth: const FlexColumnWidth(1),
          children: [
            TableRow(
              children: List.generate(7, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xFFEEEEEE)
                        ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _weeks[index],
                      style: FontTheme.of(context,
                          size: FontSize.bodyMedium,
                          weight: FontWeight.w400,
                          color: index == 0 ? const Color(0xFFFF2D55) : index == 6 ? const Color(0xFF007AFF) : Theme.of(context).colorScheme.tertiary
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),

        // 날짜 달력
        Table(
          defaultColumnWidth: const FlexColumnWidth(1),
          children: calendarWeeks.map((week) {
            return TableRow(
              children: List.generate(7, (dayIndex) {

                DateTime date = week[dayIndex];
                bool isToday = widget.today.compareTo(date) == 0;

                return GestureDetector(
                  onTap: () {
                    // 탭 이벤트 처리
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isToday ? Theme.of(context).colorScheme.onSecondary : null,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: (widget.currentMonth.year != date.year || widget.currentMonth.month != date.month) ? const Color(0xFF797979)
                                    : isToday ? Theme.of(context).colorScheme.onPrimary
                                    : date.weekday == 7 ? const Color(0xFFFF2D55)
                                    : date.weekday == 6 ? const Color(0xFF007AFF)
                                    : Theme.of(context).colorScheme.primary
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4,),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 50,
                          ),
                          child: Column(
                            children: _events[date]?.map((e) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                                  child: Text(
                                    "• ${e.title}",
                                    style: FontTheme.of(context,
                                        fontColor: FontColor.f1,
                                        size: FontSize.bodySmall,
                                        weight: FontWeight.w300
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                            ).toList() ?? [],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}


