import 'package:flutter/material.dart';

/// Expiry badge widget để hiển thị trạng thái hạn sử dụng
///
/// Cung cấp:
/// - Color coding theo thời gian hết hạn
/// - Text hiển thị thời gian còn lại
/// - Icon indicators
/// - Customizable styling
class ExpiryBadgeWidget extends StatelessWidget {
  final DateTime expiryDate;
  final DateTime? currentDate;
  final ExpiryBadgeStyle style;
  final bool showIcon;
  final bool showText;
  final String? customText;
  final VoidCallback? onTap;

  const ExpiryBadgeWidget({
    super.key,
    required this.expiryDate,
    this.currentDate,
    this.style = ExpiryBadgeStyle.auto,
    this.showIcon = true,
    this.showText = true,
    this.customText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = currentDate ?? DateTime.now();
    final daysUntilExpiry = expiryDate.difference(now).inDays;
    final expiryStatus = _getExpiryStatus(daysUntilExpiry);

    final badgeData = _getBadgeData(expiryStatus, daysUntilExpiry);

    Widget badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeData.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: badgeData.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(badgeData.icon, size: 14, color: badgeData.foregroundColor),
            const SizedBox(width: 4),
          ],
          if (showText) ...[
            Text(
              customText ?? badgeData.text,
              style: TextStyle(
                color: badgeData.foregroundColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      badge = GestureDetector(onTap: onTap, child: badge);
    }

    return badge;
  }

  ExpiryStatus _getExpiryStatus(int daysUntilExpiry) {
    if (daysUntilExpiry < 0) {
      return ExpiryStatus.expired;
    } else if (daysUntilExpiry == 0) {
      return ExpiryStatus.expiresToday;
    } else if (daysUntilExpiry <= 1) {
      return ExpiryStatus.expiresTomorrow;
    } else if (daysUntilExpiry <= 3) {
      return ExpiryStatus.expiresSoon;
    } else if (daysUntilExpiry <= 7) {
      return ExpiryStatus.expiresThisWeek;
    } else {
      return ExpiryStatus.fresh;
    }
  }

  BadgeData _getBadgeData(ExpiryStatus status, int daysUntilExpiry) {
    switch (status) {
      case ExpiryStatus.expired:
        return BadgeData(
          text: 'Hết hạn',
          icon: Icons.warning,
          backgroundColor: Colors.red.shade100,
          foregroundColor: Colors.red.shade800,
          borderColor: Colors.red.shade300,
        );
      case ExpiryStatus.expiresToday:
        return BadgeData(
          text: 'Hết hạn hôm nay',
          icon: Icons.warning_amber,
          backgroundColor: Colors.orange.shade100,
          foregroundColor: Colors.orange.shade800,
          borderColor: Colors.orange.shade300,
        );
      case ExpiryStatus.expiresTomorrow:
        return BadgeData(
          text: 'Hết hạn ngày mai',
          icon: Icons.schedule,
          backgroundColor: Colors.amber.shade100,
          foregroundColor: Colors.amber.shade800,
          borderColor: Colors.amber.shade300,
        );
      case ExpiryStatus.expiresSoon:
        return BadgeData(
          text: 'Hết hạn trong $daysUntilExpiry ngày',
          icon: Icons.schedule,
          backgroundColor: Colors.yellow.shade100,
          foregroundColor: Colors.yellow.shade800,
          borderColor: Colors.yellow.shade300,
        );
      case ExpiryStatus.expiresThisWeek:
        return BadgeData(
          text: 'Hết hạn trong $daysUntilExpiry ngày',
          icon: Icons.schedule,
          backgroundColor: Colors.blue.shade100,
          foregroundColor: Colors.blue.shade800,
          borderColor: Colors.blue.shade300,
        );
      case ExpiryStatus.fresh:
        return BadgeData(
          text: 'Còn $daysUntilExpiry ngày',
          icon: Icons.check_circle,
          backgroundColor: Colors.green.shade100,
          foregroundColor: Colors.green.shade800,
          borderColor: Colors.green.shade300,
        );
    }
  }
}

/// Expiry countdown widget
class ExpiryCountdownWidget extends StatefulWidget {
  final DateTime expiryDate;
  final DateTime? currentDate;
  final ExpiryCountdownStyle style;
  final VoidCallback? onExpired;

  const ExpiryCountdownWidget({
    super.key,
    required this.expiryDate,
    this.currentDate,
    this.style = ExpiryCountdownStyle.auto,
    this.onExpired,
  });

  @override
  State<ExpiryCountdownWidget> createState() => _ExpiryCountdownWidgetState();
}

class _ExpiryCountdownWidgetState extends State<ExpiryCountdownWidget> {
  late DateTime _currentDate;
  late Duration _timeUntilExpiry;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.currentDate ?? DateTime.now();
    _updateTimeUntilExpiry();

    // Update every minute
    Future.delayed(const Duration(minutes: 1), _updateTimer);
  }

  void _updateTimer() {
    if (mounted) {
      setState(() {
        _currentDate = DateTime.now();
        _updateTimeUntilExpiry();
      });

      // Check if expired
      if (_timeUntilExpiry.isNegative) {
        widget.onExpired?.call();
      } else {
        // Schedule next update
        Future.delayed(const Duration(minutes: 1), _updateTimer);
      }
    }
  }

  void _updateTimeUntilExpiry() {
    _timeUntilExpiry = widget.expiryDate.difference(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    final isExpired = _timeUntilExpiry.isNegative;
    final days = _timeUntilExpiry.inDays.abs();
    final hours = _timeUntilExpiry.inHours.abs() % 24;
    final minutes = _timeUntilExpiry.inMinutes.abs() % 60;

    String text;
    Color color;

    if (isExpired) {
      text =
          'Hết hạn ${days > 0
              ? '$days ngày'
              : hours > 0
              ? '$hours giờ'
              : '$minutes phút'}';
      color = Colors.red;
    } else if (days > 0) {
      text = 'Còn $days ngày';
      color = days <= 3 ? Colors.orange : Colors.green;
    } else if (hours > 0) {
      text = 'Còn $hours giờ';
      color = Colors.orange;
    } else {
      text = 'Còn $minutes phút';
      color = Colors.red;
    }

    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
    );
  }
}

/// Enums và data classes
enum ExpiryStatus {
  expired,
  expiresToday,
  expiresTomorrow,
  expiresSoon,
  expiresThisWeek,
  fresh,
}

enum ExpiryBadgeStyle { auto, compact, detailed }

enum ExpiryCountdownStyle { auto, daysOnly, hoursOnly, minutesOnly }

class BadgeData {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const BadgeData({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });
}
