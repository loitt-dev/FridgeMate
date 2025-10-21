# Design System Module

## 📋 Tổng Quan

Design System module cung cấp theme, colors, typography, spacing, và reusable UI components cho FridgeMate.

## 🎯 Nguyên Tắc

- **Consistent UI**: Đảm bảo consistency across apps
- **Reusable Components**: Base components có thể tái sử dụng
- **Theme Support**: Light/Dark theme
- **No Dependencies**: Không phụ thuộc business logic
- **Scalable**: Dễ dàng extend và customize

## 📁 Cấu Trúc

```
lib/
├── design_system.dart
├── theme/
│   ├── app_theme.dart              # Main theme configuration
│   ├── light_theme.dart            # Light theme
│   └── dark_theme.dart             # Dark theme
├── values/
│   ├── color/
│   │   └── app_color.dart          # Color palette
│   ├── dimen/
│   │   └── app_dimen.dart          # Spacing & dimensions
│   └── typography/
│       └── app_font_size.dart      # Font sizes
├── components/
│   ├── buttons/                    # Button components
│   ├── inputs/                     # Input components
│   ├── cards/                      # Card components
│   └── dialogs/                    # Dialog components
└── resources/
    └── app_icons.dart              # App icons
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

### Theme Configuration

```dart
class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppColor.lightColorScheme,
    textTheme: AppTypography.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
    ),
  );
  
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppColor.darkColorScheme,
    textTheme: AppTypography.textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
    ),
  );
}
```

### Color Palette

```dart
class AppColor {
  // Primary Colors
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryVariant = Color(0xFF1B5E20);
  static const Color onPrimary = Color(0xFFFFFFFF);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color secondaryVariant = Color(0xFF388E3C);
  static const Color onSecondary = Color(0xFFFFFFFF);
  
  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFFF3F3F3);
  
  // Error Colors
  static const Color error = Color(0xFFB3261E);
  static const Color onError = Color(0xFFFFFFFF);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  // FridgeMate Specific
  static const Color fridge = Color(0xFF81C784);
  static const Color medicine = Color(0xFF64B5F6);
  static const Color expiry = Color(0xFFFF5722);
  
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onError,
  );
}
```

### Typography

```dart
class AppTypography {
  static const String fontFamily = 'Roboto';
  
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    ),
  );
}
```

### Dimensions

```dart
class AppDimen {
  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  
  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
  
  // Icon Sizes
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;
  
  // Button Heights
  static const double buttonHeightS = 32.0;
  static const double buttonHeightM = 48.0;
  static const double buttonHeightL = 56.0;
}
```

### Reusable Components

```dart
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(context),
      child: Text(text, style: _getTextStyle(context)),
    );
  }
}

enum AppButtonType { primary, secondary, outline, text }
enum AppButtonSize { small, medium, large }
```

## ✅ Validation

- [ ] Pure UI - no business logic
- [ ] KHÔNG phụ thuộc domain/data
- [ ] KHÔNG có get_it
- [ ] Theme được setup đúng
- [ ] Color palette đầy đủ
- [ ] Typography consistent
- [ ] Components reusable
- [ ] Dark/Light theme support

## 🚀 Phase 1 Features

- **Material 3**: Modern Material Design
- **Color System**: Consistent color palette
- **Typography**: Readable font system
- **Components**: Buttons, inputs, cards
- **Theme Support**: Light/Dark themes
- **Responsive**: Adaptive layouts