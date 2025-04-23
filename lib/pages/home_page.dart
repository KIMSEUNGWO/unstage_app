

import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/ImageSlider.dart';
import 'package:unstage_app/component/account_format.dart';
import 'package:unstage_app/component/svg_icon.dart';
import 'package:unstage_app/dto/Concert.dart';
import 'package:unstage_app/dto/Location.dart';
import 'package:unstage_app/dto/poster_slide.dart';
import 'package:intl/intl.dart';
import 'package:unstage_app/pages/concert_page.dart';
import 'package:unstage_app/pages/component/ListBuilder.dart';
import 'package:unstage_app/pages/component/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  final List<Concert> _concerts = [
    Concert(image: 'assets/temp/temp1.jpg', title: 'asdasdasdasdasdasd幸運の呪文は...あ.な.た', adv: 20000, door: 25000, openDate: DateTime(2025, 3, 13, 16, 30), startTime: DateTime(2025, 3, 13, 17, 00), location: '아틀리에홀'),
    Concert(image: 'assets/temp/temp2.jpg', title: 'また一歩 STAGE Vol.10', adv: 15000, door: 20000, openDate: DateTime(2025, 3, 13, 17, 00), startTime: DateTime(2025, 3, 13, 17, 30), location: '아틀리에홀'),
    Concert(image: 'assets/temp/temp3.jpg', title: 'Dream Walker Vol.1', adv: 0, door: 0, openDate: DateTime(2025, 3, 13, 18, 00), startTime: DateTime(2025, 3, 13, 18, 30), location: '아틀리에홀'),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: false, // 스크롤 시 나타나게 하려면 true
            snap: false, // 스크롤을 약간만 내려도 완전히 표시되게 하려면 true
            pinned: false, // 항상 상단에 고정하려면 true, 완전히 사라지게 하려면 false
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                ImageSlider(
                  height: 250,
                  images: [
                    PosterSlide(image: Image.asset('assets/temp/temp1.jpg',), concertId: 1),
                    PosterSlide(image: Image.asset('assets/temp/temp2.jpg',), concertId: 2),
                    PosterSlide(image: Image.asset('assets/temp/temp3.jpg',), concertId: 3),
                    PosterSlide(image: Image.asset('assets/temp/temp4.jpg',), concertId: 4),
                    PosterSlide(image: Image.asset('assets/temp/temp5.jpg',), concertId: 5),
                    PosterSlide(image: Image.asset('assets/temp/temp6.jpg',), concertId: 6),
                  ],
                ),
                const SizedBox(height: 21,),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('M월 d일').format(DateTime.now()),
                        style: FontTheme.of(context,
                          size: FontSize.displaySmall,
                          fontColor: FontColor.f1,
                          weight: FontWeight.w500
                        )
                      ),
                      Text('오늘 열리는 핫한 공연들, 현장에서 만나요',
                        style: FontTheme.of(context,
                          size: FontSize.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 16,),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ListBuilder.build(
                      horizontal: 20,
                      child: _concerts.map((concert) =>
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ConcertPage(concertId: 1,);
                            },));
                          },
                          child: CustomContainer(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(concert.image),
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: 4,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withValues(alpha: 0.7),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Text('OPEN ${DateFormat("HH:mm").format(concert.openDate)}',
                                            style: FontTheme.of(context,
                                              color: Colors.white,
                                              size: FontSize.bodySmall,
                                              weight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 6,),
                                Text(concert.title,
                                  style: FontTheme.of(context,
                                    fontColor: FontColor.f1,
                                    size: FontSize.bodyMedium,
                                    weight: FontWeight.w500
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 12,),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('ADV',
                                    style: FontTheme.of(context,
                                      fontColor: FontColor.f2,
                                      size: FontSize.bodySmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(AccountFormatter.format(concert.adv),
                                    style: FontTheme.of(context,
                                      fontColor: FontColor.f1,
                                      size: FontSize.bodyLarge,
                                      weight: FontWeight.w500
                                    )
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      ).toList(),
                    )
                  ),
                ),

                const SizedBox(height: 36,),

                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('국내 겐바',
                        style: FontTheme.of(context,
                          size: FontSize.displaySmall,
                          fontColor: FontColor.f1,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text('다가오는 겐바 일정을 확인해보세요.',
                        style: FontTheme.of(context,
                          size: FontSize.bodyMedium,
                        ),
                      ),

                      const SizedBox(height: 16,),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(height: 8,),
                        itemCount: _concerts.length,
                        itemBuilder: (context, index) {
                          final concert = _concerts[index];
                          return CustomContainer(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 120,
                                  child: Image.asset(concert.image),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(DateFormat('yyyy.MM.dd(EEE)', 'ko_KR').format(concert.openDate),
                                        style: FontTheme.of(context,
                                          fontColor: FontColor.f2,
                                          size: FontSize.bodySmall,
                                        ),
                                      ),
                                      const SizedBox(height: 2,),
                                      Text(concert.title,
                                        style: FontTheme.of(context,
                                          fontColor: FontColor.f1,
                                          size: FontSize.displaySmall,
                                          weight: FontWeight.w500
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Text('OPEN ',
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f3,
                                              size: FontSize.bodyMedium,
                                            ),
                                          ),
                                          Text(DateFormat('HH:mm', 'ko_KR').format(concert.openDate),
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f1,
                                              size: FontSize.bodyMedium,
                                            ),
                                          ),
                                          const SizedBox(width: 4,),
                                          Text('|',
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f3,
                                              size: FontSize.bodyMedium,
                                            ),
                                          ),
                                          const SizedBox(width: 4,),
                                          Text('START ',
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f3,
                                              size: FontSize.bodyMedium,
                                            ),
                                          ),
                                          Text(DateFormat('HH:mm', 'ko_KR').format(concert.startTime),
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f1,
                                              size: FontSize.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2,),
                                      Row(
                                        children: [
                                          SvgIcon.asset(sIcon: SIcon.location,
                                            style: SvgIconStyle(
                                                width: 12, height: 12
                                            ),
                                          ),
                                          const SizedBox(width: 4,),
                                          Text(concert.location,
                                            style: FontTheme.of(context,
                                              fontColor: FontColor.f2,
                                              size: FontSize.bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8,),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text('ADV',
                                          style: FontTheme.of(context,
                                            fontColor: FontColor.f2,
                                            size: FontSize.bodySmall,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(AccountFormatter.format(concert.adv),
                                          style: FontTheme.of(context,
                                            fontColor: FontColor.f1,
                                            size: FontSize.bodyLarge,
                                            weight: FontWeight.w500
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),


                const SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      );
  }

  @override
  bool get wantKeepAlive => true;
}
