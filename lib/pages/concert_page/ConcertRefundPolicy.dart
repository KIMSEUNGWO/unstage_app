
import 'package:flutter/material.dart';
import 'package:unstage_app/component/FontTheme.dart';

class ConcertRefundPolicy extends StatelessWidget {
  const ConcertRefundPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('환불방법',
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
                Text('· 프로필 > 예매내역 > 환불신청',
                  style: FontTheme.of(context,
                    fontColor: FontColor.f1,
                    size: FontSize.bodyMedium,
                  ),
                ),
                const SizedBox(height: 6,),
                Text('· 결제수단에 따라 환불/입금까지 최대 5영업일 소요',
                  style: FontTheme.of(context,
                    fontColor: FontColor.f1,
                    size: FontSize.bodyMedium,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 21,),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('환불규정',
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
                    Text('구매 후 30분이내',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w400
                      ),
                    ),
                    Text('전액환불',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('공연 7일 전 ~',
                      style: FontTheme.of(context,
                          fontColor: FontColor.f2,
                          size: FontSize.bodyMedium,
                          weight: FontWeight.w400
                      ),
                    ),
                    Text('전액환불',
                      style: FontTheme.of(context,
                          fontColor: FontColor.f1,
                          size: FontSize.bodyMedium,
                          weight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('공연 6일 ~ 4일 전',
                      style: FontTheme.of(context,
                          fontColor: FontColor.f2,
                          size: FontSize.bodyMedium,
                          weight: FontWeight.w400
                      ),
                    ),
                    Text('10% 공제 후 환불',
                      style: FontTheme.of(context,
                          fontColor: FontColor.f1,
                          size: FontSize.bodyMedium,
                          weight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('공연 3일 ~ 2일 전',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w400,
                      ),
                    ),
                    Text('20% 공제 후 환불',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('공연 1일 전',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f2,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w400,
                      ),
                    ),
                    Text('30% 공제 후 환불',
                      style: FontTheme.of(context,
                        fontColor: FontColor.f1,
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('공연 당일 및 이후',
                      style: FontTheme.of(context,
                        color: const Color(0xFFFF0000),
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w400,
                      ),
                    ),
                    Text('환불불가',
                      style: FontTheme.of(context,
                        color: const Color(0xFFFF0000),
                        size: FontSize.bodyMedium,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 21,),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('주의사항',
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
                Text('· 관람 당일 티켓 환불/변경 불가',
                  style: FontTheme.of(context,
                    color: const Color(0xFFFF0000),
                    size: FontSize.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
