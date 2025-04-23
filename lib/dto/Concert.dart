

import 'package:unstage_app/dto/ExtraPrice.dart';
import 'package:unstage_app/dto/Location.dart';

class Concert {

  final String image;
  final String title;
  final int adv;
  final int door;
  final DateTime openDate;
  final DateTime startTime;
  final String location;

  Concert({required this.image, required this.title, required this.adv, required this.door, required this.openDate, required this.startTime, required this.location});

}