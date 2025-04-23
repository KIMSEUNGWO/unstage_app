
import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/component/svg_icon.dart';
import 'package:unstage_app/dto/Concert.dart';
import 'package:unstage_app/dto/ConcertDetail.dart';

class ConcertInformation extends StatelessWidget {

  final ConcertDetail concert;
  const ConcertInformation({super.key, required this.concert});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/temp/temp5.jpg', fit: BoxFit.fitWidth,),
            ),
          ),
          const SizedBox(height: 21,),


          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('유의 사항',
              style: FontTheme.of(context,
                size: FontSize.bodyLarge,
                fontColor: FontColor.f1,
                weight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('· 지각으로 인해 관람하지 못할 시 환불/변경 불가',
                  style: FontTheme.of(context,
                    fontColor: FontColor.f1,
                    size: FontSize.bodyMedium,
                  ),
                ),
                const SizedBox(height: 6,),
                Text('· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가',
                  style: FontTheme.of(context,
                    fontColor: FontColor.f1,
                    size: FontSize.bodyMedium,
                  ),
                ),
                const SizedBox(height: 6,),
                Text('· 공연 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.',
                  style: FontTheme.of(context,
                    color: const Color(0xFFFF0000),
                    size: FontSize.bodyMedium,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 21,),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Text('장소 안내',
                  style: FontTheme.of(context,
                      size: FontSize.bodyLarge,
                      fontColor: FontColor.f1,
                      weight: FontWeight.w500
                  ),
                ),
                const SizedBox(width: 6,),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 2, 7, 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      SvgIcon.asset(sIcon: SIcon.map, style: SvgIconStyle(
                        color: Theme.of(context).colorScheme.onPrimary
                      )),
                      const SizedBox(width: 2,),
                      Text('지도',
                        style: FontTheme.of(context,
                          fontColor: FontColor.main,
                          size: FontSize.bodySmall,
                          weight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('장소',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                    Text(concert.location.name,
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('주소',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                    Row(
                      children: [
                        Text(concert.location.address,
                          style: FontTheme.of(context,
                            fontColor: FontColor.f1,
                            size: FontSize.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: 4,),
                        Text('복사',
                          style: FontTheme.of(context,
                            fontColor: FontColor.f3,
                            size: FontSize.bodySmall,
                            decoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 21,),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('판매자 정보',
              style: FontTheme.of(context,
                  size: FontSize.bodyLarge,
                  fontColor: FontColor.f1,
                  weight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('주최/주관',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                    Text(concert.location.name,
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('전화',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                    Text(concert.promoter.name,
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('소셜',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                      ),
                    ),
                    Container(
                      width: 22, height: 22,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF111111),
                      ),
                      child: SvgIcon.asset(sIcon: SIcon.twitter,),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
