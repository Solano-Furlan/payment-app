import 'package:intl/intl.dart';

class DateFormatterHelper {
  DateFormatterHelper._();

  static String smartDate({
    required DateTime date,
  }) {
    if (isToday(date: date)) {
      return 'Today at ${getTime(
        date: date,
      )}';
    }
    if (isYesterday(date: date)) {
      return 'Yesterday at ${getTime(
        date: date,
      )}';
    }
    if (date.isAfter(
      DateTime.now().subtract(const Duration(days: 6)),
    )) {
      return DateFormat('EEEE').format(
        date,
      );
    } else {
      return DateFormat('M/d/yy').format(
        date,
      );
    }
  }

  static String getTime({
    required DateTime date,
  }) {
    return DateFormat('hh:mm a').format(
      date,
    );
  }

  static bool isToday({
    required DateTime date,
  }) {
    final now = DateTime.now();
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }

  static bool isYesterday({
    required DateTime date,
  }) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == date.day &&
        yesterday.month == date.month &&
        yesterday.year == date.year;
  }
}
