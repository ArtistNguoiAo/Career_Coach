import 'package:intl/intl.dart';

class StringUtils {
  static String getInitialsName(String fullName) {
    final words = fullName.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    if (words.length == 1) return words.first[0].toUpperCase();

    final first = words.first[0].toUpperCase();
    final last = words.last[0].toUpperCase();
    return '$first$last';
  }

  static String convertDateString(String input) {
    DateTime date = DateTime.parse(input);
    return DateFormat('HH:mm:ss dd/MM/yyyy').format(date);
  }
}