

import 'package:unstage_app/dto/ConcerSchedule.dart';
import 'package:unstage_app/dto/ExtraPrice.dart';
import 'package:unstage_app/dto/Location.dart';
import 'package:unstage_app/dto/Promoter.dart';

class ConcertDetail {

  final String image;
  final String title;
  final int adv;
  final int door;
  final DateTime openDate;
  final DateTime startTime;
  final Location location;
  final ExtraPrice? extraPrice;
  final Promoter promoter;
  final List<ConcertSchedule> schedules;

  ConcertDetail({required this.promoter, required this.image, required this.title, required this.adv, required this.door, required this.openDate, required this.startTime, required this.location, required this.extraPrice, required this.schedules});



}