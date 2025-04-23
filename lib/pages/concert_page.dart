
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/account_format.dart';
import 'package:unstage_app/component/svg_icon.dart';
import 'package:unstage_app/dto/ConcerSchedule.dart';
import 'package:unstage_app/dto/Concert.dart';
import 'package:unstage_app/dto/ConcertDetail.dart';
import 'package:unstage_app/dto/ExtraPrice.dart';
import 'package:unstage_app/dto/Location.dart';
import 'package:unstage_app/dto/Participant.dart';
import 'package:unstage_app/dto/Promoter.dart';
import 'package:unstage_app/pages/concert_page/ConcertInformation.dart';
import 'package:unstage_app/pages/concert_page/ConcertParticipants.dart';
import 'package:unstage_app/pages/concert_page/ConcertRefundPolicy.dart';

class ConcertPage extends StatefulWidget {

  final int concertId;
  const ConcertPage({super.key, required this.concertId});

  @override
  State<ConcertPage> createState() => _ConcertPageState();
}

class _ConcertPageState extends State<ConcertPage> {

  late final ConcertDetail _concert;
  late final List<Widget> _pages;
  final List<String> _pageNames = ['정보', '출연자', '환불규정'];
  int _index = 0;

  init() async {
    _concert = ConcertDetail(
      image: 'assets/temp/temp5.jpg',
      title: 'asdasdasdasdasdasd幸運の呪文は...あ.な.た',
      adv: 20000,
      door: 25000,
      openDate: DateTime(2025, 3, 13, 17, 00),
      startTime: DateTime(2025, 3, 13, 17, 20),
      location: Location(
          name: '아틀리에홀',
          address: '서울 마포구 와우산로18길 16, 지하 2층',
          url: 'https://map.naver.com/p/entry/place/1632575084?c=15.00,0,0,0,dh'),
      extraPrice: ExtraPrice(name: 'STUDENT', price: 0),
      promoter: Promoter(name: '코지프로덕션', callNumber: '02-123-4567', url: 'https://naver.com'),
      schedules: [
        ConcertSchedule(
          scheduleId: 1,
          startDate: DateTime(2025,3,13,17,20),
          endDate: DateTime(2025,3,13,17,40),
          participant: Participant(
              artistId: 1,
              image: Image.asset('assets/temp/네오에스픽.jpg'),
              name: '네오에스픽',
              url: 'https://naver.com',
          ),
        ),
        ConcertSchedule(
          scheduleId: 2,
          startDate: DateTime(2025,3,13,17,40),
          endDate: DateTime(2025,3,13,18,00),
          participant: Participant(
            artistId: 2,
            image: Image.asset('assets/temp/네키루.jpg'),
            name: '네키루',
            url: 'https://naver.com',
          ),
        ),
        ConcertSchedule(
          scheduleId: 3,
          startDate: DateTime(2025,3,13,18,00),
          endDate: DateTime(2025,3,13,18,20),
          participant: Participant(
            artistId: 3,
            image: Image.asset('assets/temp/데이드림.jpg'),
            name: '데이드림',
            url: 'https://naver.com',
          ),
        ),
        ConcertSchedule(
          scheduleId: 4,
          startDate: DateTime(2025,3,13,18,20),
          endDate: DateTime(2025,3,13,18,40),
          participant: Participant(
            artistId: 1,
            image: Image.asset('assets/temp/료타츠키.jpg'),
            name: '료타츠키',
            url: 'https://naver.com',
          ),
        ),
        ConcertSchedule(
          scheduleId: 4,
          startDate: DateTime(2025,3,13,18,40),
          endDate: DateTime(2025,3,13,19,00),
          participant: Participant(
            artistId: 1,
            image: Image.asset('assets/temp/명계생물관리감찰과.jpg'),
            name: '명계생물관리감찰과',
            url: 'https://naver.com',
          ),
        ),
        ConcertSchedule(
          scheduleId: 5,
          startDate: DateTime(2025,3,13,19,00),
          endDate: DateTime(2025,3,13,19,30),
          eventTitle: 'FAN MEETING'
        ),
      ],
    );

    _pages = [
      ConcertInformation(concert: _concert),
      ConcertSchedules(schedules: _concert.schedules),
      const ConcertRefundPolicy(),
    ];
  }

  _onChanged(int index) {
    setState(() {
      _index = index;
    });
  }
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0, right: 0,
            child: Image.asset(_concert.image, fit: BoxFit.fitWidth,),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.33,
                  ),
                  padding: const EdgeInsets.only(
                    left: 20, right: 20,
                    bottom: 21
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 31),
                        width: 48, height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFFe5e6eb),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(DateFormat('yyyy.MM.dd(EEE)', 'ko_KR').format(_concert.openDate),
                          style: FontTheme.of(context,
                            size: FontSize.bodyLarge,
                            fontColor: FontColor.f3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(_concert.title,
                          style: FontTheme.of(context,
                            size: FontSize.displayLarge,
                            fontColor: FontColor.f1,
                            weight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SvgIcon.asset(sIcon: SIcon.location),
                            const SizedBox(width: 2,),
                            Text(_concert.location.name,
                              style: FontTheme.of(context,
                                size: FontSize.bodyLarge,
                                fontColor: FontColor.f2,
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('OPEN ',
                            style: FontTheme.of(context,
                              fontColor: FontColor.f3,
                              size: FontSize.bodyLarge,
                            ),
                          ),
                          Text(DateFormat('HH:mm', 'ko_KR').format(_concert.openDate),
                            style: FontTheme.of(context,
                              fontColor: FontColor.f1,
                              size: FontSize.bodyLarge,
                              weight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Text('|',
                            style: FontTheme.of(context,
                              fontColor: FontColor.f3,
                              size: FontSize.bodyLarge,
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Text('START ',
                            style: FontTheme.of(context,
                              fontColor: FontColor.f3,
                              size: FontSize.bodyLarge,
                            ),
                          ),
                          Text(DateFormat('HH:mm', 'ko_KR').format(_concert.startTime),
                            style: FontTheme.of(context,
                              fontColor: FontColor.f1,
                              size: FontSize.bodyLarge,
                              weight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('ADV',
                                style: FontTheme.of(context,
                                  fontColor: FontColor.f3,
                                  size: FontSize.bodyMedium,
                                ),
                              ),
                              Text(AccountFormatter.format(_concert.adv),
                                style: FontTheme.of(context,
                                  fontColor: FontColor.f1,
                                  size: FontSize.bodyLarge,
                                  weight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            width: 1,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: const BorderRadius.all(Radius.circular(1)),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('DOOR',
                                style: FontTheme.of(context,
                                  fontColor: FontColor.f3,
                                  size: FontSize.bodyMedium,
                                ),
                              ),
                              Text(AccountFormatter.format(_concert.door),
                                style: FontTheme.of(context,
                                  fontColor: FontColor.f1,
                                  size: FontSize.bodyLarge,
                                  weight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          if (_concert.extraPrice != null)
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              width: 1,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: const BorderRadius.all(Radius.circular(1)),
                              ),
                            ),
                          if (_concert.extraPrice != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(_concert.extraPrice!.name,
                                  style: FontTheme.of(context,
                                    fontColor: FontColor.f3,
                                    size: FontSize.bodyMedium,
                                  ),
                                ),
                                Text(AccountFormatter.format(_concert.extraPrice!.price),
                                  style: FontTheme.of(context,
                                    fontColor: FontColor.f1,
                                    size: FontSize.bodyLarge,
                                    weight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE)
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      for (int i=0;i<_pageNames.length;i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _onChanged(i);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: _index == i
                                      ? BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 3)
                                      : BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 0),
                                  ),
                                color: Colors.white
                              ),
                              child: Center(
                                child: Text(_pageNames[i],
                                  style: FontTheme.of(context,
                                    fontColor: _index == i ? FontColor.main : FontColor.f3,
                                    size: FontSize.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                    ],
                  ),
                ),
                _pages[_index],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, // 바깥 컨테이너는 투명하게
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // 좌우 패딩으로 너비 제한
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).colorScheme.onPrimary
              ),
              child: Center(
                child: Text('예매',
                  style: FontTheme.of(context,
                      color: Colors.white,
                      size: FontSize.displaySmall,
                      weight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
