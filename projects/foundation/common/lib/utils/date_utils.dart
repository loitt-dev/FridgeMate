import 'package:intl/intl.dart';

/// Date and time utilities for FridgeMate
class DateUtils {
  DateUtils._();

  /// Format date with Vietnamese locale
  static String formatDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern, 'vi_VN').format(date);
  }

  /// Format date and time
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm', 'vi_VN').format(dateTime);
  }

  /// Format time only
  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm', 'vi_VN').format(dateTime);
  }

  /// Get relative time string (e.g., "2 ngày trước")
  static String getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút trước';
    } else {
      return 'Vừa xong';
    }
  }

  /// Check if date is expiring soon
  static bool isExpiringSoon(DateTime expiryDate, {int daysThreshold = 3}) {
    final now = DateTime.now();
    final difference = expiryDate.difference(now).inDays;
    return difference <= daysThreshold && difference >= 0;
  }

  /// Check if date is expired
  static bool isExpired(DateTime expiryDate) {
    return DateTime.now().isAfter(expiryDate);
  }

  /// Get days until expiry
  static int getDaysUntilExpiry(DateTime expiryDate) {
    final now = DateTime.now();
    return expiryDate.difference(now).inDays;
  }

  /// Check if two dates are the same day
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Get start of day
  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get end of day
  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// Add days to date
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// Subtract days from date
  static DateTime subtractDays(DateTime date, int days) {
    return date.subtract(Duration(days: days));
  }

  /// Get Vietnamese day name
  static String getVietnameseDayName(DateTime date) {
    const dayNames = [
      'Chủ nhật',
      'Thứ hai',
      'Thứ ba',
      'Thứ tư',
      'Thứ năm',
      'Thứ sáu',
      'Thứ bảy',
    ];
    return dayNames[date.weekday % 7];
  }

  /// Get Vietnamese month name
  static String getVietnameseMonthName(DateTime date) {
    const monthNames = [
      'Tháng 1',
      'Tháng 2',
      'Tháng 3',
      'Tháng 4',
      'Tháng 5',
      'Tháng 6',
      'Tháng 7',
      'Tháng 8',
      'Tháng 9',
      'Tháng 10',
      'Tháng 11',
      'Tháng 12',
    ];
    return monthNames[date.month - 1];
  }

  /// Parse date from string
  static DateTime? parseDate(
    String dateString, {
    String pattern = 'dd/MM/yyyy',
  }) {
    try {
      return DateFormat(pattern, 'vi_VN').parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Get age from birth date
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
