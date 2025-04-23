
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unstage_app/component/FontTheme.dart';
import 'package:unstage_app/dto/ConcerSchedule.dart';

class ConcertSchedules extends StatelessWidget {

  final List<ConcertSchedule> schedules;

  const ConcertSchedules({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 36),
      color: Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 5,),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final event = schedules[index];
          final isLast = schedules.length - 1 == index;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 11, height: 11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: !isLast ? Center(
                      child: Container(
                        width: 7, height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ) : null,
                  ),
                  const SizedBox(width: 15,),
                  Text('${DateFormat('HH:mm').format(event.startDate)} ~ ${DateFormat('HH:mm').format(event.endDate)}',
                    style: FontTheme.of(context,
                      fontColor: FontColor.f1,
                      size: FontSize.bodyLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 1, height: 100,
                    decoration: BoxDecoration(
                      color: isLast ? Colors.transparent : Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            offset: const Offset(0, 2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: eventWidget(context, event),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget eventWidget(BuildContext context, ConcertSchedule schedule) {
  if (schedule.eventTitle != null) {
    return Row(
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.2)
          ),
        ),
        const SizedBox(width: 10,),
        Text(schedule.eventTitle!,
          style: FontTheme.of(context,
            fontColor: FontColor.f1,
            size: FontSize.bodyLarge,
            fontFamily: 'Tmoney'
          ),
        )
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: schedule.participant?.image,
            ),
            const SizedBox(width: 10,),
            Text(schedule.participant!.name,
              style: FontTheme.of(context,
                fontColor: FontColor.f1,
                size: FontSize.bodyLarge,
                fontFamily: 'Tmoney',
              ),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios_rounded,
          color: Theme.of(context).colorScheme.tertiary,
          size: 16,
        ),
      ],
    );
  }
}