library advanced_date_formatter;
import 'package:intl/intl.dart';

class AdvancedDateFormatter {
  /// Returns the given DateTime object as a string in the specified format.
  /// For example, it will return the date in the 'yyyy-MM-dd HH:mm:ss' format.
  static String format({
    required DateTime date,  // DateTime object to be formatted
    String format = 'yyyy-MM-dd HH:mm:ss',  // Default format if none is provided
  }) {
    final buffer = StringBuffer();

    // A map to store the different parts of the date for formatting
    final formatMap = {
      'yyyy': date.year.toString(),
      'MM': date.month.toString().padLeft(2, '0'),  // Format month with two digits
      'dd': date.day.toString().padLeft(2, '0'),    // Format day with two digits
      'HH': date.hour.toString().padLeft(2, '0'),    // Format hour with two digits
      'mm': date.minute.toString().padLeft(2, '0'),  // Format minute with two digits
      'ss': date.second.toString().padLeft(2, '0'),  // Format second with two digits
    };

    // Use regular expression to match the format groups (yyyy, MM, dd, etc.)
    final regex = RegExp(r'(yyyy|MM|dd|HH|mm|ss)');
    String tempFormat = format;

    // Replace each format group with the corresponding value from the formatMap
    for (final match in regex.allMatches(format)) {
      final group = match.group(0)!;
      tempFormat = tempFormat.replaceFirst(group, formatMap[group]!);
    }

    buffer.write(tempFormat);  // Append the formatted date to the buffer
    return buffer.toString();
  }

  /// Returns a human-readable string representing the time ago from the given date.
  /// For example, it will return "2 days ago" or "5 hours ago".
  static String timeAgo({required DateTime date, DateTime? referenceDate}) {
    referenceDate ??= DateTime.now();  // If no reference date is provided, use the current date
    final duration = referenceDate.difference(date);  // Calculate the difference between the dates

    // Return the time difference in a human-readable format
    if (duration.inDays >= 365) {
      return '${duration.inDays ~/ 365} years ago';
    } else if (duration.inDays >= 30) {
      return '${duration.inDays ~/ 30} months ago';
    } else if (duration.inDays >= 1) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours >= 1) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes >= 1) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'just now';  // If the difference is less than a minute, return "just now"
    }
  }

  /// Returns the name of the day of the week for the given date in the specified locale.
  /// For example, it will return "Monday" in English or "Pazartesi" in Turkish.
  static String getDayName(DateTime date, {String locale = 'en'}) {
    const daysTR = [
      'Pazar',
      'Pazartesi',
      'Salı',
      'Çarşamba',
      'Perşembe',
      'Cuma',
      'Cumartesi'
    ];
    const daysEN = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    final dayIndex = date.weekday % 7;  // Get the index of the day of the week (0 = Sunday)
    if (locale == 'tr') {
      return daysTR[dayIndex];  // Return the day name in Turkish
    } else {
      return daysEN[dayIndex];  // Return the day name in English
    }
  }

  /// Formats the given DateTime object with the specified time zone.
  /// For example, it will return a date like '2024-12-30 14:45' with the time zone applied.
  String formatWithTimeZone(DateTime date, String timeZone) {
    final DateFormat dateFormat = DateFormat.yMd().add_jm();
    return dateFormat
        .format(date.toUtc().add(Duration(hours: int.parse(timeZone))));  // Add the time zone offset and format
  }

  /// Returns the difference between two dates in years and months.
  String timeDifference(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);
    final years = (difference.inDays / 365).floor();  // Calculate the difference in years
    final months = ((difference.inDays % 365) / 30).floor();  // Calculate the difference in months
    return '$years years $months months';  // Return the difference in years and months
  }

  /// Returns a short-formatted date, like 'Dec 30, 2024'.
  String customShortFormat(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Returns a long-formatted date, like 'Monday, December 30, 2024 14:45:30'.
  String customLongFormat(DateTime date) {
    return DateFormat('EEEE, MMMM dd, yyyy HH:mm:ss').format(date);
  }

  /// Returns the number of days remaining until the target date.
  /// For example, it will return "5 days left".
  String countdownToDate(DateTime targetDate) {
    final now = DateTime.now();
    final difference = targetDate.difference(now);  // Calculate the difference between the target date and now
    final daysLeft = difference.inDays;  // Get the number of days remaining
    return '$daysLeft days left';  // Return the countdown string
  }

  /// Returns a detailed time difference between the given date and now.
  /// For example, it will return "2 days, 3 hours, 14 minutes, 5 seconds ago".
  String detailedTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    return '$days days, $hours hours, $minutes minutes, $seconds seconds ago';  // Return the detailed time difference
  }
}
