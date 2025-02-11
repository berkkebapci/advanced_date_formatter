# 📅 Advanced Date Formatter

**Advanced Date Formatter** is a powerful and flexible date and time formatting package for Flutter applications. It provides an easy-to-use API for formatting dates, calculating time differences, and retrieving localized day names. This package is optimized for performance and supports multiple languages.

## Features

- **Custom Date and Time Formatting**: Easily format dates with custom patterns (e.g., `yyyy-MM-dd HH:mm:ss`, `MMM dd, yyyy`).
- **Human-Readable Time Differences**: Convert dates into "time ago" format (e.g., `"2 days ago"`, `"5 minutes ago"`).
- **Localized Day Names**: Get the name of the day in different languages (e.g., `"Monday"` or `"Pazartesi"`).
- **Countdown to a Specific Date**: Calculate how many days are left until a future date.
- **Time Zone Formatting**: Adjust date formatting based on time zone offsets.
- **Optimized Performance**: Lightweight and efficient for real-time date calculations.

## Getting Started

### Requirements

- **Flutter SDK**: `>=3.0.0`
- **Dart SDK**: `>=3.0.0`

### Installation

To use this package, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  advanced_date_formatter: ^1.0.0
```

```dart
flutter pub get
```

## Usage

1. Date Formatting
You can format a date in a custom format using the AdvancedDateFormatter.format() function:

```dart
import 'package:advanced_date_formatteradvanced_date_formatter.dart';

DateTime now = DateTime.now();
String formattedDate = AdvancedDateFormatter.format(date: now, format: 'yyyy-MM-dd HH:mm:ss');
print(formattedDate);  // Example output: 2025-02-11 15:30:00
```

2. Time Ago
To display the time elapsed from a specific date, use the timeAgo() function:

```dart
DateTime pastDate = DateTime.now().subtract(Duration(days: 3));
String timeAgo = AdvancedDateFormatter.timeAgo(date: pastDate);
print(timeAgo);  // Example output: 3 days ago
```

3. Day Name
To get the day name (e.g., Monday, Tuesday) for a specific date:

```dart
String dayName = AdvancedDateFormatter.getDayName(DateTime.now());
print(dayName);  // Example output: Monday
```

4. Time Zone Support
Format a date in a specific time zone using the formatWithTimeZone() function:

```dart
String formattedDateWithTimezone = AdvancedDateFormatter.formatWithTimeZone(DateTime.now(), '3');
print(formattedDateWithTimezone);  // Example output: 2/11/2025 3:30 PM
```
5. Time Difference
To calculate the difference between two dates in years and months, use the timeDifference() function:

```dart
DateTime startDate = DateTime(2020, 1, 1);
DateTime endDate = DateTime.now();
String difference = AdvancedDateFormatter.timeDifference(startDate, endDate);
print(difference);  // Example output: 5 years 1 months
```
6. Short and Long Date Formats
You can get a date in a short or long format:

```dart
String shortFormat = AdvancedDateFormatter.formatShort(DateTime.now());
print(shortFormat);  // Example output: Feb 11, 2025

String longFormat = AdvancedDateFormatter.formatLong(DateTime.now());
print(longFormat);  // Example output: Monday, February 11, 2025
```

7. ISO 8601 Format
Convert a date to ISO 8601 format using the toIsoFormat() function:

```dart
String isoFormat = AdvancedDateFormatter.toIsoFormat(DateTime.now());
print(isoFormat);  // Example output: 2025-02-11T12:30:00.000Z
```
8. Countdown
To show the time remaining until a target date, use the countdownToDate() function:

```dart
DateTime targetDate = DateTime(2025, 12, 31);
String countdown = AdvancedDateFormatter.countdownToDate(targetDate);
print(countdown);  // Example output: 321 days left
```

9. Detailed Time Ago
To display a detailed time difference (days, hours, minutes, seconds) from a given date:

```dart
DateTime pastDate = DateTime.now().subtract(Duration(days: 2, hours: 5, minutes: 30));
String detailedTimeAgo = AdvancedDateFormatter.detailedTimeAgo(pastDate);
print(detailedTimeAgo);  // Example output: 2 days, 5 hours, 30 minutes, 0 seconds ago
```

## License
This package is licensed under the MIT License.
