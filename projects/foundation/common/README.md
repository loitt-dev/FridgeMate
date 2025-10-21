# Common Module

## 📋 Tổng Quan

Common module cung cấp utilities, extensions, constants, và helper functions được sử dụng across toàn bộ FridgeMate app.

## 🎯 Nguyên Tắc

- **Reusable Utilities**: Functions và classes có thể tái sử dụng
- **Extensions**: Dart extensions cho built-in types
- **Constants**: App-wide constants
- **No Dependencies**: Không phụ thuộc business logic
- **Pure Functions**: Stateless utility functions

## 📁 Cấu Trúc

```
lib/
├── common.dart
├── utils/
│   ├── date_utils.dart             # Date/time utilities
│   ├── format_utils.dart           # Formatting utilities
│   ├── validation_utils.dart       # Validation helpers
│   └── math_utils.dart             # Math utilities
├── extensions/
│   ├── string_extensions.dart      # String extensions
│   ├── datetime_extensions.dart    # DateTime extensions
│   ├── context_extensions.dart     # BuildContext extensions
│   └── list_extensions.dart        # List extensions
├── constants/
│   ├── app_constants.dart          # App constants
│   ├── regex_constants.dart        # Regex patterns
│   └── date_constants.dart         # Date formats
├── helpers/
│   ├── file_helper.dart            # File operations
│   ├── image_helper.dart           # Image utilities
│   └── device_helper.dart          # Device info
└── mixins/
    ├── loading_mixin.dart          # Loading state mixin
    └── validation_mixin.dart       # Validation mixin
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

## 📝 Sử Dụng

### Date Utilities

```dart
class DateUtils {
  static String formatDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern).format(date);
  }
  
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }
  
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
  
  static bool isExpiringSoon(DateTime expiryDate, {int daysThreshold = 3}) {
    final now = DateTime.now();
    final difference = expiryDate.difference(now).inDays;
    return difference <= daysThreshold && difference >= 0;
  }
  
  static bool isExpired(DateTime expiryDate) {
    return DateTime.now().isAfter(expiryDate);
  }
}
```

### Format Utilities

```dart
class FormatUtils {
  static String formatCurrency(double amount, {String currency = 'VND'}) {
    final formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: currency == 'VND' ? '₫' : currency,
    );
    return formatter.format(amount);
  }
  
  static String formatNumber(double number, {int decimalPlaces = 0}) {
    return NumberFormat('#,##0.${'0' * decimalPlaces}').format(number);
  }
  
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
  
  static String formatPhoneNumber(String phone) {
    if (phone.length == 10) {
      return '${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7)}';
    }
    return phone;
  }
}
```

### Validation Utilities

```dart
class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  static bool isValidPhone(String phone) {
    return RegExp(r'^[0-9]{10,11}$').hasMatch(phone);
  }
  
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }
  
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'Trường này'} không được để trống';
    }
    return null;
  }
  
  static String? validateMinLength(String? value, int minLength, {String? fieldName}) {
    if (value == null || value.length < minLength) {
      return '${fieldName ?? 'Trường này'} phải có ít nhất $minLength ký tự';
    }
    return null;
  }
}
```

### String Extensions

```dart
extension StringExtensions on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
  
  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }
  
  bool get isNullOrEmpty => isEmpty;
  
  bool get isNotNullOrEmpty => isNotEmpty;
  
  String removeVietnameseAccents() {
    const vietnamese = 'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ';
    const english = 'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiioooooooooooooooouuuuuuuuuuuyyyyy';
    
    String result = this;
    for (int i = 0; i < vietnamese.length; i++) {
      result = result.replaceAll(vietnamese[i], english[i]);
    }
    return result;
  }
}
```

### DateTime Extensions

```dart
extension DateTimeExtensions on DateTime {
  String get formattedDate => DateUtils.formatDate(this);
  
  String get formattedDateTime => DateUtils.formatDateTime(this);
  
  String get relativeTime => DateUtils.getRelativeTime(this);
  
  bool get isExpiringSoon => DateUtils.isExpiringSoon(this);
  
  bool get isExpired => DateUtils.isExpired(this);
  
  DateTime get startOfDay => DateTime(year, month, day);
  
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);
  
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
```

### Context Extensions

```dart
extension ContextExtensions on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  
  // MediaQuery
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  
  // Navigation
  void goTo(String location) => NavigationService.go(location);
  void pushTo(String location) => NavigationService.push(location);
  void popRoute([Object? result]) => NavigationService.pop(result);
  
  // Snackbar
  void showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
  
  // Dialog
  Future<T?> showAppDialog<T>(Widget dialog) {
    return showDialog<T>(context: this, builder: (_) => dialog);
  }
}
```

### List Extensions

```dart
extension ListExtensions<T> on List<T> {
  List<T> get unique => toSet().toList();
  
  T? get firstOrNull => isEmpty ? null : first;
  
  T? get lastOrNull => isEmpty ? null : last;
  
  List<T> whereNotNull() => where((element) => element != null).cast<T>().toList();
  
  void addIfNotNull(T? item) {
    if (item != null) add(item);
  }
  
  List<T> addAllIfNotNull(Iterable<T?> items) {
    addAll(items.whereNotNull());
    return this;
  }
}
```

## ✅ Validation

- [ ] Pure utilities - no business logic
- [ ] KHÔNG phụ thuộc domain/data
- [ ] KHÔNG có get_it
- [ ] Extensions hữu ích
- [ ] Utilities được test
- [ ] Constants được organize
- [ ] Helpers reusable

## 🚀 Phase 1 Features

- **Date/Time Utils**: Format và validation dates
- **String Extensions**: Vietnamese text handling
- **Validation**: Input validation helpers
- **Format Utils**: Currency, numbers, file sizes
- **Context Extensions**: Theme, navigation, dialogs
- **List Extensions**: Collection utilities
