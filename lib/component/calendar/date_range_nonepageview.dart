

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:unstage_app/component/calendar/calendar_date_helper.dart';

class MonthRangeNonePageView {

  final DateTime min;
  final DateTime max;

  MonthRangeNonePageView({DateTime? min, DateTime? max}):
    min = min ?? DateTime(1900, 1, 1),
    max = max ?? DateTime(2999, 12, 1);

}
