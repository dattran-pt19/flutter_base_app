import 'package:easy_localization/easy_localization.dart';

enum AppDateFormat {
  yearMonthDay("yyyy-MM-dd"),
  dayMonthYear("dd/MM/yyyy"),
  dayMonthYearHourMinute("dd/MM/yyyy HH:mm"),
  dayMonthYearHourMinuteSecond("dd/MM/yyyy HH:mm:ss");

  const AppDateFormat(this.formatString);

  final String formatString;
}

extension DateExtension on DateTime {
  String toStringFormat(AppDateFormat format) {
    return DateFormat(format.formatString).format(this);
  }

  bool isPastDay() {
    final now = DateTime.now();
    return now.year > year ||
        (now.year == year && now.month > month) ||
        (now.year == year && now.month == month && now.day > day);
  }

  bool isGreaterMonthOf(DateTime date) {
    return year > date.year ||
        (year == date.year && month > date.month);
  }
}