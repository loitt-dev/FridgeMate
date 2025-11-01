# FridgeMate Design System

A comprehensive design system for the FridgeMate app following Material 3 design principles.

## 📋 Overview

The FridgeMate Design System provides a complete set of design tokens, components, and themes to ensure consistent UI across both the Fridge Manager and Medicine Box Manager apps.

## 🎨 Design Principles

- **Material 3**: Following Google's latest Material Design guidelines
- **Accessibility**: WCAG 2.1 AA compliant color contrasts and touch targets
- **Consistency**: Unified design language across all components
- **Scalability**: Easy to extend and customize for future features
- **Performance**: Optimized for smooth animations and interactions

## 🏗️ Architecture

```
lib/
├── design_system.dart          # Main export file
├── theme/                      # Theme system
│   ├── app_theme.dart         # Central theme configuration
│   ├── light_theme.dart       # Light theme implementation
│   └── dark_theme.dart        # Dark theme implementation
├── values/                     # Design tokens
│   ├── color/                 # Color system
│   ├── dimen/                 # Spacing and sizing
│   └── typography/            # Font sizes and weights
├── components/                 # Reusable components
│   ├── buttons/               # Button variants
│   ├── inputs/                # Form inputs
│   ├── cards/                 # Card components
│   ├── badges/                # Status badges
│   ├── chips/                 # Category chips
│   └── dialogs/               # Modal dialogs
└── resources/                  # Icons and assets
    └── app_icons.dart         # Icon system
```

## 🚀 Quick Start

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  design_system:
    path: projects/foundation/design_system
```

### Basic Usage

```dart
import 'package:design_system/design_system.dart';

// Use in your app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}
```

## 🎨 Design Tokens

### Colors

The color system includes semantic colors for different states:

```dart
// Primary colors
AppColor.primary              // Main brand color
AppColor.secondary            // Fresh green for healthy items
AppColor.tertiary             // Warning orange for expiry

// Status colors
AppColor.statusFresh          // Green for fresh items
AppColor.statusExpiringSoon   // Orange for expiring soon
AppColor.statusExpired        // Red for expired items

// Category colors
AppColor.categoryMeat         // Brown for meat
AppColor.categoryVegetable    // Green for vegetables
AppColor.categoryFruit        // Orange for fruits
// ... and more
```

### Typography

Font sizes follow Material 3 typography scale:

```dart
// Display text
AppFontSize.displayLarge      // 57.0 - Hero text
AppFontSize.displayMedium     // 45.0 - Section headers
AppFontSize.displaySmall      // 36.0 - Page titles

// Body text
AppFontSize.bodyLarge         // 16.0 - Main content
AppFontSize.bodyMedium        // 14.0 - Secondary content
AppFontSize.bodySmall         // 12.0 - Captions

// FridgeMate specific
AppFontSize.itemName          // 16.0 - Item names
AppFontSize.recipeTitle       // 18.0 - Recipe titles
AppFontSize.expiryDate        // 12.0 - Expiry dates
```

### Spacing

8pt grid system for consistent spacing:

```dart
// Spacing scale
AppDimen.spacingS             // 8.0 - Base unit
AppDimen.spacingM             // 12.0 - 1.5x base
AppDimen.spacingL             // 16.0 - 2x base
AppDimen.spacingXL            // 20.0 - 2.5x base
AppDimen.spacingXXL           // 24.0 - 3x base

// Component specific
AppDimen.itemCardHeight       // 120.0 - Item card height
AppDimen.recipeCardHeight     // 200.0 - Recipe card height
AppDimen.expiryBadgeSize      // 24.0 - Badge size
```

## 🧩 Components

### Buttons

```dart
// Filled button
AppButton(
  text: 'Add Item',
  variant: AppButtonVariant.filled,
  size: AppButtonSize.medium,
  onPressed: () => addItem(),
)

// Outlined button
AppButton(
  text: 'Cancel',
  variant: AppButtonVariant.outlined,
  onPressed: () => cancel(),
)

// With icon
AppButton(
  text: 'Save',
  icon: AppIcons.save,
  onPressed: () => save(),
)
```

### Expiry Badge

```dart
// Fresh item
ExpiryBadge.fresh(text: 'Fresh')

// Expiring soon
ExpiryBadge.expiringSoon(text: '2 days left')

// Expired
ExpiryBadge.expired(text: 'Expired')

// Custom
ExpiryBadge(
  status: ExpiryStatus.fresh,
  text: 'Good until 2024-01-15',
  size: ExpiryBadgeSize.large,
)
```

### Category Chip

```dart
// Food category
CategoryChip(
  label: 'Vegetables',
  category: CategoryType.vegetable,
  isSelected: true,
  onTap: () => selectCategory(),
)

// Medicine category
CategoryChip(
  label: 'Prescription',
  category: CategoryType.medicine,
  isDeletable: true,
  onDeleted: () => removeCategory(),
)
```

### Cards

```dart
// Basic card
AppCard(
  child: Text('Card content'),
  onTap: () => openDetails(),
)

// With custom styling
AppCard(
  child: ItemContent(),
  elevation: 4,
  borderRadius: BorderRadius.circular(12),
  padding: EdgeInsets.all(16),
)
```

## 🎯 Icons

Comprehensive icon system for FridgeMate:

```dart
// Storage icons
AppIcons.fridge               // Kitchen/fridge icon
AppIcons.medicine             // Medicine icon
AppIcons.addItem              // Add item icon

// Category icons
AppIcons.meat                 // Meat category
AppIcons.vegetable            // Vegetable category
AppIcons.fruit                // Fruit category

// Status icons
AppIcons.fresh                // Fresh status
AppIcons.expiryWarning        // Expiry warning
AppIcons.expired              // Expired status

// Action icons
AppIcons.camera               // Camera for scanning
AppIcons.barcodeScan          // Barcode scanning
AppIcons.search               // Search functionality
```

## 🌙 Theme Support

### Light Theme

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  home: MyHomePage(),
)
```

### Dark Theme

```dart
MaterialApp(
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.dark,
  home: MyHomePage(),
)
```

### Dynamic Theme

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system, // Follows system setting
  home: MyHomePage(),
)
```

## 📱 Responsive Design

The design system includes responsive breakpoints:

```dart
// Breakpoints
AppDimen.breakpointMobile     // 600.0 - Mobile devices
AppDimen.breakpointTablet     // 900.0 - Tablets
AppDimen.breakpointDesktop    // 1200.0 - Desktop

// Usage in widgets
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < AppDimen.breakpointMobile) {
      return MobileLayout();
    } else if (constraints.maxWidth < AppDimen.breakpointTablet) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```

## ♿ Accessibility

All components are built with accessibility in mind:

- **Color Contrast**: WCAG 2.1 AA compliant
- **Touch Targets**: Minimum 48dp touch targets
- **Screen Readers**: Proper semantic labels
- **High Contrast**: Support for high contrast mode
- **Large Text**: Scalable typography

## 🧪 Testing

The design system includes comprehensive testing:

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📚 Examples

See the `examples/` directory for complete usage examples:

- Basic app setup
- Component showcase
- Theme switching
- Responsive layouts

## 🤝 Contributing

When contributing to the design system:

1. Follow Material 3 guidelines
2. Maintain consistency with existing components
3. Add comprehensive documentation
4. Include tests for new components
5. Update this README for new features

## 📄 License

This design system is part of the FridgeMate project and follows the same license terms.

## 🔗 Related

- [Material 3 Design Guidelines](https://m3.material.io/)
- [Flutter Material 3](https://docs.flutter.dev/ui/material/material-3)
- [Accessibility Guidelines](https://docs.flutter.dev/development/accessibility-and-localization/accessibility)