
import 'package:intl/intl.dart';

class AccountFormatter {

  static String format(int amount) {
    if (amount < 1) return '무료';
    final formatter = NumberFormat.decimalPattern('ko_KR');
    return '${formatter.format(amount)}원';
  }
}