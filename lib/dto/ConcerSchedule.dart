
import 'package:unstage_app/dto/Participant.dart';

class ConcertSchedule {

  final int scheduleId;
  final DateTime startDate;
  final DateTime endDate;

  final String? eventTitle;
  final Participant? participant;

  ConcertSchedule({required this.scheduleId, required this.startDate, required this.endDate, this.eventTitle, this.participant});
}