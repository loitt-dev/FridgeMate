import '../utils/date_utils.dart';

/// DateTime extensions for FridgeMate
extension DateTimeExtensions on DateTime {
  /// Format date with Vietnamese locale
  String get formattedDate => DateUtils.formatDate(this);

  /// Format date and time
  String get formattedDateTime => DateUtils.formatDateTime(this);

  /// Format time only
  String get formattedTime => DateUtils.formatTime(this);

  /// Get relative time string
  String get relativeTime => DateUtils.getRelativeTime(this);

  /// Check if date is expiring soon
  bool get isExpiringSoon => DateUtils.isExpiringSoon(this);

  /// Check if date is expired
  bool get isExpired => DateUtils.isExpired(this);

  /// Get days until expiry
  int get daysUntilExpiry => DateUtils.getDaysUntilExpiry(this);

  /// Get start of day
  DateTime get startOfDay => DateUtils.getStartOfDay(this);

  /// Get end of day
  DateTime get endOfDay => DateUtils.getEndOfDay(this);

  /// Add days
  DateTime addDays(int days) => DateUtils.addDays(this, days);

  /// Subtract days
  DateTime subtractDays(int days) => DateUtils.subtractDays(this, days);

  /// Get Vietnamese day name
  String get vietnameseDayName => DateUtils.getVietnameseDayName(this);

  /// Get Vietnamese month name
  String get vietnameseMonthName => DateUtils.getVietnameseMonthName(this);

  /// Check if two dates are the same day
  bool isSameDay(DateTime other) => DateUtils.isSameDay(this, other);

  /// Check if date is today
  bool get isToday => isSameDay(DateTime.now());

  /// Check if date is yesterday
  bool get isYesterday => isSameDay(DateTime.now().subtractDays(1));

  /// Check if date is tomorrow
  bool get isTomorrow => isSameDay(DateTime.now().addDays(1));

  /// Check if date is this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtractDays(now.weekday - 1);
    final endOfWeek = startOfWeek.addDays(6);
    return isAfter(startOfWeek.startOfDay) && isBefore(endOfWeek.endOfDay);
  }

  /// Check if date is this month
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// Check if date is this year
  bool get isThisYear {
    return year == DateTime.now().year;
  }

  /// Get age from birth date
  int get age => DateUtils.getAge(this);

  /// Get start of week (Monday)
  DateTime get startOfWeek {
    final daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).startOfDay;
  }

  /// Get end of week (Sunday)
  DateTime get endOfWeek {
    final daysToSunday = 7 - weekday;
    return add(Duration(days: daysToSunday)).endOfDay;
  }

  /// Get start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Get end of month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59);

  /// Get start of year
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// Get end of year
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59);

  /// Get days in month
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Check if year is leap year
  bool get isLeapYear {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// Get quarter (1-4)
  int get quarter {
    return ((month - 1) ~/ 3) + 1;
  }

  /// Get start of quarter
  DateTime get startOfQuarter {
    final quarterStartMonth = ((quarter - 1) * 3) + 1;
    return DateTime(year, quarterStartMonth, 1);
  }

  /// Get end of quarter
  DateTime get endOfQuarter {
    final quarterEndMonth = quarter * 3;
    return DateTime(year, quarterEndMonth + 1, 0, 23, 59, 59);
  }

  /// Get week number in year
  int get weekNumber {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysSinceFirstDay = difference(firstDayOfYear).inDays;
    return ((daysSinceFirstDay + firstDayOfYear.weekday - 1) ~/ 7) + 1;
  }

  /// Check if date is weekend
  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Check if date is weekday
  bool get isWeekday => !isWeekend;

  /// Get next weekday (Monday-Friday)
  DateTime get nextWeekday {
    DateTime next = addDays(1);
    while (next.isWeekend) {
      next = next.addDays(1);
    }
    return next;
  }

  /// Get previous weekday
  DateTime get previousWeekday {
    DateTime previous = subtractDays(1);
    while (previous.isWeekend) {
      previous = previous.subtractDays(1);
    }
    return previous;
  }

  /// Get next occurrence of specific weekday
  DateTime nextWeekdayOccurrence(int targetWeekday) {
    if (targetWeekday < 1 || targetWeekday > 7) {
      throw ArgumentError('Weekday must be between 1 (Monday) and 7 (Sunday)');
    }

    int daysUntilTarget = (targetWeekday - weekday) % 7;
    if (daysUntilTarget == 0) daysUntilTarget = 7;

    return addDays(daysUntilTarget);
  }

  /// Get previous occurrence of specific weekday
  DateTime previousWeekdayOccurrence(int targetWeekday) {
    if (targetWeekday < 1 || targetWeekday > 7) {
      throw ArgumentError('Weekday must be between 1 (Monday) and 7 (Sunday)');
    }

    int daysSinceTarget = (weekday - targetWeekday) % 7;
    if (daysSinceTarget == 0) daysSinceTarget = 7;

    return subtractDays(daysSinceTarget);
  }

  /// Get time until another date
  Duration timeUntil(DateTime other) {
    return other.difference(this);
  }

  /// Get time since another date
  Duration timeSince(DateTime other) {
    return difference(other);
  }

  /// Check if date is between two dates (inclusive)
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start.subtract(const Duration(microseconds: 1))) &&
        isBefore(end.add(const Duration(microseconds: 1)));
  }

  /// Get human readable time difference
  String get humanReadableDifference {
    final now = DateTime.now();
    final difference = this.difference(now).abs();

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? '1 năm' : '$years năm';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 tháng' : '$months tháng';
    } else if (difference.inDays > 0) {
      return difference.inDays == 1 ? '1 ngày' : '${difference.inDays} ngày';
    } else if (difference.inHours > 0) {
      return difference.inHours == 1 ? '1 giờ' : '${difference.inHours} giờ';
    } else if (difference.inMinutes > 0) {
      return difference.inMinutes == 1
          ? '1 phút'
          : '${difference.inMinutes} phút';
    } else {
      return 'Vừa xong';
    }
  }

  /// Get ISO 8601 string
  String get toIso8601String => toUtc().toIso8601String();

  /// Create DateTime from ISO 8601 string
  static DateTime fromIso8601String(String isoString) {
    return DateTime.parse(isoString);
  }

  /// Get timestamp in milliseconds
  int get timestampMs => millisecondsSinceEpoch;

  /// Get timestamp in seconds
  int get timestampSeconds => (millisecondsSinceEpoch / 1000).floor();

  /// Create DateTime from timestamp in milliseconds
  static DateTime fromTimestampMs(int timestampMs) {
    return DateTime.fromMillisecondsSinceEpoch(timestampMs);
  }

  /// Create DateTime from timestamp in seconds
  static DateTime fromTimestampSeconds(int timestampSeconds) {
    return DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
  }
}
