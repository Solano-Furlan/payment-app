import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._();

  static String smartDate({
    required DateTime date,
  }) {
    final int differenceInMinutes = DateTime.now().difference(date).inMinutes;
    if (differenceInMinutes < 2) {
      return 'Now';
    }

    if (isToday(date: date)) {
      return 'Today';
    }
    if (isYesterday(date: date)) {
      return 'Yesterday';
    }
    if (date.isAfter(
      DateTime.now().subtract(const Duration(days: 6)),
    )) {
      return DateFormat('EEEE').format(
        date,
      );
    } else {
      return DateFormat('dd MMM yyyy').format(
        date,
      );
    }
  }

  static String calendarDate({
    required DateTime date,
  }) =>
      DateFormat('dd MMM yyyy hh:mm a').format(date);

  static String calendarDateOnlyDate({
    required DateTime date,
  }) =>
      DateFormat('dd MMM yyyy').format(date);

  static String calendarDateOnlyTime({
    required DateTime date,
  }) =>
      DateFormat('hh:mm a').format(date);

  static String calendarDateTimeRange({
    required DateTime startsAt,
    required DateTime endsAt,
  }) =>
      '${DateFormat('hh:mm a').format(startsAt)} to ${DateFormat('hh:mm a').format(endsAt)}';

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

  static String getTime({
    required DateTime date,
  }) {
    return DateFormat('hh:mm a').format(
      date,
    );
  }

  static bool isSameMonthAndYear({
    required DateTime date1,
    required DateTime date2,
  }) {
    return date1.year == date2.year && date1.month == date2.month;
  }
}
