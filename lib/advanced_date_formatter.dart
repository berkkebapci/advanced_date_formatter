library advanced_date_formatter;

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdvancedDateFormatter {
  static String format({
    required DateTime date,
    String format = 'yyyy-MM-dd HH:mm:ss',
    String locale = 'en',
  }) {
    return DateFormat(format, locale).format(date);
  }

  static String timeAgo({required DateTime date, String locale = 'en'}) {
    return timeago.format(date, locale: locale);
  }

  static String getDayName(DateTime date, {String locale = 'en'}) {
    return DateFormat.E(locale).format(date);
  }

  static String formatWithTimeZone(DateTime date, String timeZone) {
    int offset;
    try {
      offset = int.parse(timeZone);
    } catch (e) {
      throw ArgumentError('Invalid time zone format');
    }
    return DateFormat.yMd().add_jm().format(date.toUtc().add(Duration(hours: offset)));
  }

  static String timeDifference(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);
    final years = (difference.inDays / 365).floor();
    final months = ((difference.inDays % 365) / 30).floor();
    return '$years years $months months';
  }

  static String formatShort(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMMMd(locale).format(date);
  }

  static String formatLong(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMMMMEEEEd(locale).format(date);
  }

  static String toIsoFormat(DateTime date) {
    return date.toUtc().toIso8601String();
  }

  static String countdownToDate(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now);
    return '${difference.inDays} days left';
  }

  static String detailedTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    return '$days days, $hours hours, $minutes minutes, $seconds seconds ago';
  }
}
