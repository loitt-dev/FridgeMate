import 'package:intl/intl.dart';

/// Formatting utilities for FridgeMate
class FormatUtils {
  FormatUtils._();

  /// Format currency with Vietnamese locale
  static String formatCurrency(double amount, {String currency = 'VND'}) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: currency == 'VND' ? '₫' : currency,
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  /// Format number with thousand separators
  static String formatNumber(double number, {int decimalPlaces = 0}) {
    final formatter = NumberFormat('#,##0.${'0' * decimalPlaces}', 'vi_VN');
    return formatter.format(number);
  }

  /// Format file size
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Format phone number (Vietnamese format)
  static String formatPhoneNumber(String phone) {
    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (digits.length == 10) {
      return '${digits.substring(0, 4)} ${digits.substring(4, 7)} ${digits.substring(7)}';
    } else if (digits.length == 11 && digits.startsWith('0')) {
      return '${digits.substring(0, 4)} ${digits.substring(4, 7)} ${digits.substring(7)}';
    }
    return phone;
  }

  /// Format percentage
  static String formatPercentage(double value, {int decimalPlaces = 1}) {
    final formatter = NumberFormat('#,##0.${'0' * decimalPlaces}', 'vi_VN');
    return '${formatter.format(value)}%';
  }

  /// Format weight
  static String formatWeight(double weight, {String unit = 'g'}) {
    if (weight >= 1000 && unit == 'g') {
      return '${(weight / 1000).toStringAsFixed(1)} kg';
    }
    return '${weight.toStringAsFixed(1)} $unit';
  }

  /// Format volume
  static String formatVolume(double volume, {String unit = 'ml'}) {
    if (volume >= 1000 && unit == 'ml') {
      return '${(volume / 1000).toStringAsFixed(1)} l';
    }
    return '${volume.toStringAsFixed(1)} $unit';
  }

  /// Format temperature
  static String formatTemperature(double temperature, {String unit = '°C'}) {
    return '${temperature.toStringAsFixed(1)}$unit';
  }

  /// Format duration in human readable format
  static String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} ngày ${duration.inHours % 24} giờ';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} giờ ${duration.inMinutes % 60} phút';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} phút';
    } else {
      return '${duration.inSeconds} giây';
    }
  }

  /// Format cooking time
  static String formatCookingTime(int minutes) {
    if (minutes >= 60) {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        return '${hours}h';
      }
      return '${hours}h ${remainingMinutes}m';
    }
    return '${minutes}m';
  }

  /// Format serving size
  static String formatServingSize(int servings) {
    return '$servings ${servings == 1 ? 'phần' : 'phần'}';
  }

  /// Format rating
  static String formatRating(double rating, {int decimalPlaces = 1}) {
    return rating.toStringAsFixed(decimalPlaces);
  }

  /// Format quantity
  static String formatQuantity(double quantity, {String unit = ''}) {
    if (quantity == quantity.toInt()) {
      return '${quantity.toInt()}${unit.isNotEmpty ? ' $unit' : ''}';
    }
    return '${quantity.toStringAsFixed(1)}${unit.isNotEmpty ? ' $unit' : ''}';
  }

  /// Format barcode
  static String formatBarcode(String barcode) {
    // Add spaces every 4 digits for better readability
    final digits = barcode.replaceAll(RegExp(r'[^\d]'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i += 4) {
      if (i > 0) buffer.write(' ');
      buffer.write(
        digits.substring(i, i + 4 > digits.length ? digits.length : i + 4),
      );
    }
    return buffer.toString();
  }

  /// Format address
  static String formatAddress({
    String? street,
    String? ward,
    String? district,
    String? city,
    String? country = 'Việt Nam',
  }) {
    final parts = <String>[];
    if (street?.isNotEmpty == true) parts.add(street!);
    if (ward?.isNotEmpty == true) parts.add(ward!);
    if (district?.isNotEmpty == true) parts.add(district!);
    if (city?.isNotEmpty == true) parts.add(city!);
    if (country?.isNotEmpty == true) parts.add(country!);

    return parts.join(', ');
  }
}
