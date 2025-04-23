
import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/calendar/calender_nonepageview.dart';
import 'package:unstage_app/component/calendar/date_range_nonepageview.dart';
import 'package:unstage_app/component/svg_icon.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with AutomaticKeepAliveClientMixin {

  final TextEditingController _textEditingController = TextEditingController();
  bool _cancelDisabled = true;

  _textOnChanged(String text) {
    _textEditingController.text = text;
    setState(() {
      _cancelDisabled = text.isEmpty;
    });
  }


  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(-1.5, -1.5),
                        blurRadius: 1,
                        color: Colors.black12,
                        blurStyle: BlurStyle.inner
                    ),
                    BoxShadow(
                        offset: Offset(-1, -1),
                        blurRadius: 1,
                        color: Colors.white,
                        blurStyle: BlurStyle.inner
                    ),
                  ]
              ),
              child: Stack(
                  children: [
                    TextField(
                      controller: _textEditingController,
                      onChanged: (value) => _textOnChanged(value),
                      maxLines: 1,
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyLarge,
                      ),
                      decoration: InputDecoration(
                        // icon: SvgIcon.asset(sIcon: SIcon.search),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 6), // 아이콘과 텍스트 사이 간격을 6으로 설정
                          child: SvgIcon.asset(sIcon: SIcon.search),
                        ),
                        prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                        isDense: true, // 이 속성이 중요! 더 작은 높이를 제공합니다
                        contentPadding: EdgeInsets.zero, // 내부 패딩 제거
                        hintText: '일정 또는 아티스트를 검색해보세요.',
                        hintStyle: FontTheme.of(context,
                          fontColor: FontColor.f3,
                          size: FontSize.bodyLarge,
                        ),
                        hintMaxLines: 1,
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),

                      ),
                    ),

                    if (!_cancelDisabled)
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () => _textOnChanged(''),
                          child: SvgIcon.asset(sIcon: SIcon.cancel),
                        ),
                      ),
                  ]
              ),
            ),
            centerTitle: true,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 36,),),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CalenderNonePageView(
                monthRange: MonthRangeNonePageView(
                  min: DateTime(2025,01),
                  max: DateTime.now()
                ),

              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
