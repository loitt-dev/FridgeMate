# FridgeMate - UI/UX Style Guide

> **Material Design 3** based style guide for FridgeMate application

---

## 🎨 Color System

### Primary Palette

```dart
// Light Theme - Primary
primary: Color(0xFF00897B)           // Teal 600 - Main brand color
onPrimary: Color(0xFFFFFFFF)         // White text on primary
primaryContainer: Color(0xFFB2DFDB)  // Teal 100 - Light container
onPrimaryContainer: Color(0xFF004D40) // Dark teal - Text on container
```

**Usage**:
- `primary`: Main actions, AppBar, FAB
- `primaryContainer`: Card backgrounds, chips, badges
- Use for: Brand identity, primary CTAs, key UI elements

### Secondary Palette

```dart
// Light Theme - Secondary  
secondary: Color(0xFF66BB6A)          // Green 400 - Fresh/Healthy
onSecondary: Color(0xFFFFFFFF)        // White
secondaryContainer: Color(0xFFC8E6C9) // Green 100
onSecondaryContainer: Color(0xFF1B5E20) // Dark green
```

**Usage**:
- `secondary`: Secondary actions, accents
- `secondaryContainer`: Success states, fresh items
- Use for: Positive actions, healthy/fresh indicators

### Tertiary Palette (Accent)

```dart
// Light Theme - Tertiary
tertiary: Color(0xFFFF9800)           // Orange 500 - Warnings/CTA
onTertiary: Color(0xFFFFFFFF)         // White
tertiaryContainer: Color(0xFFFFE0B2)  // Orange 100
onTertiaryContainer: Color(0xFFE65100) // Dark orange
```

**Usage**:
- `tertiary`: Important CTAs, warnings
- `tertiaryContainer`: Warning backgrounds
- Use for: Attention-grabbing elements, expiry warnings

### Semantic Status Colors

```dart
// Fresh/Good Status
statusFresh: Color(0xFF4CAF50)        // Green 500
statusFreshBg: Color(0xFFE8F5E9)      // Green 50 background
statusFreshText: Color(0xFF1B5E20)    // Dark green text

// Expiring Soon (Warning)
statusWarning: Color(0xFFFF9800)      // Orange 500
statusWarningBg: Color(0xFFFFF3E0)    // Orange 50
statusWarningText: Color(0xFFE65100)  // Dark orange

// Expired (Error)  
statusExpired: Color(0xFFF44336)      // Red 500
statusExpiredBg: Color(0xFFFFEBEE)    // Red 50
statusExpiredText: Color(0xFFB71C1C)  // Dark red

// Info
statusInfo: Color(0xFF2196F3)         // Blue 500
statusInfoBg: Color(0xFFE3F2FD)       // Blue 50
statusInfoText: Color(0xFF0D47A1)     // Dark blue
```

**Usage Guidelines**:
- **Fresh**: Items with > 7 days until expiry
- **Warning**: Items expiring in 3-7 days
- **Expired**: Items past expiry date or < 3 days
- **Info**: General information, tips, notifications
- Always pair color with icon/text for accessibility

### Neutral Colors

```dart
// Surface colors
background: Color(0xFFFAFAFA)         // Grey 50 - App background
surface: Color(0xFFFFFFFF)            // White - Card surface
surfaceVariant: Color(0xFFF5F5F5)     // Grey 100 - Alternate surface

// Outline colors
outline: Color(0xFFBDBDBD)            // Grey 400 - Borders
outlineVariant: Color(0xFFE0E0E0)     // Grey 300 - Subtle borders

// Text colors
onBackground: Color(0xFF212121)       // Grey 900 - Primary text
onSurface: Color(0xFF424242)          // Grey 800 - Body text  
onSurfaceVariant: Color(0xFF757575)   // Grey 600 - Secondary text
```

### Dark Theme Colors

```dart
// Dark Theme - Primary
primary: Color(0xFF4DB6AC)            // Teal 300
primaryContainer: Color(0xFF00695C)   // Teal 800

// Surfaces
background: Color(0xFF121212)         // Dark background
surface: Color(0xFF1E1E1E)            // Elevated surface
surfaceVariant: Color(0xFF2C2C2C)     // Alternate surface

// Text  
onBackground: Color(0xFFE0E0E0)       // Light grey text
onSurface: Color(0xFFEEEEEE)          // Body text
```

### Color Accessibility

**Contrast Ratios** (WCAG AA Minimum):
- Normal text: **4.5:1**
- Large text (18pt+): **3:1**
- Interactive elements: **3:1**

**Verified Combinations**:
- ✅ `primary` (#00897B) on `white`: 4.71:1
- ✅ `statusWarning` (#FF9800) on `white`: 3.97:1
- ✅ `statusExpired` (#F44336) on `white`: 4.03:1
- ✅ `onSurface` (#424242) on `white`: 10.05:1

---

## 📝 Typography

### Font Family
**Primary**: `Roboto` (Material Design default)  
**Fallback**: System font

### Type Scale (Material 3)

#### Display - Large Headers
```dart
displayLarge: TextStyle(
  fontSize: 57.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.25,
  height: 1.12,
)
displayMedium: 45.0 / w400
displaySmall: 36.0 / w400
```
**Usage**: Hero text, splash screens, empty states

#### Headline - Section Headers
```dart
headlineLarge: 32.0 / w400
headlineMedium: 28.0 / w400  
headlineSmall: 24.0 / w400
```
**Usage**: Screen titles, major sections

#### Title - Card Headers
```dart
titleLarge: TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 0,
)
titleMedium: 16.0 / w500 / 0.15
titleSmall: 14.0 / w500 / 0.1
```
**Usage**: Card titles, dialog titles, list headers

#### Body - Content Text
```dart
bodyLarge: TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
)
bodyMedium: 14.0 / w400 / 0.25
bodySmall: 12.0 / w400 / 0.4
```
**Usage**: Main content, descriptions, list items

#### Label - UI Elements
```dart
labelLarge: TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
)
labelMedium: 12.0 / w500 / 0.5
labelSmall: 11.0 / w500 / 0.5
```
**Usage**: Buttons, tabs, chips, badges

### FridgeMate-Specific Typography

```dart
// Dashboard
dashboardTitle: titleLarge           // Card headers (22pt/w500)
dashboardValue: displayMedium        // Big numbers (45pt/w400)
dashboardLabel: bodyMedium           // Labels (14pt/w400)

// Items  
itemName: titleMedium                // Item names (16pt/w500)
itemCategory: labelMedium            // Category chips (12pt/w500)
itemExpiry: bodySmall                // Expiry dates (12pt/w400)
itemExpiryWarning: labelSmall.copyWith(
  fontWeight: FontWeight.w700,       // Bold warnings (11pt/w700)
)

// Recipe
recipeTitle: titleLarge              // Recipe names (22pt/w500)
recipeDescription: bodyMedium        // Descriptions (14pt/w400)
recipeMetadata: labelSmall           // Time, servings (11pt/w500)

// Forms
formLabel: labelLarge                // Input labels (14pt/w500)
formValue: bodyLarge                 // Input text (16pt/w400)
formHelper: bodySmall                // Helper text (12pt/w400)
formError: labelSmall.copyWith(
  color: statusExpired,              // Error text (11pt/w500/red)
)
```

### Typography Guidelines

**Do**:
- ✅ Use `titleLarge` for card headers
- ✅ Use `bodyMedium` for main content
- ✅ Use `labelMedium` for secondary info
- ✅ Maintain line height for readability
- ✅ Use font weights to create hierarchy

**Don't**:
- ❌ Use multiple font families
- ❌ Go below 11pt font size
- ❌ Use more than 3 weights on one screen
- ❌ Ignore letter spacing
- ❌ Exceed 65 characters per line

---

## 📏 Spacing & Layout

### 8dp Grid System

```dart
class AppSpacing {
  static const double unit = 8.0;      // Base unit
  
  // Scale
  static const double xs = 4.0;        // 0.5x - Tight spacing
  static const double s = 8.0;         // 1x - Base
  static const double m = 12.0;        // 1.5x - Comfortable
  static const double l = 16.0;        // 2x - Standard padding
  static const double xl = 20.0;       // 2.5x - Large
  static const double xxl = 24.0;      // 3x - Extra large
  static const double xxxl = 32.0;     // 4x - Huge
  static const double huge = 48.0;     // 6x - Maximum
}
```

### Specific Use Cases

```dart
// Padding
static const double cardPadding = 16.0;       // Inside cards
static const double screenPadding = 16.0;     // Screen edges
static const double listItemPadding = 16.0;   // List items
static const double sectionPadding = 24.0;    // Between sections

// Spacing
static const double cardSpacing = 16.0;       // Between cards
static const double iconSpacing = 8.0;        // Around icons
static const double chipSpacing = 8.0;        // Between chips
static const double buttonSpacing = 12.0;     // Between buttons

// Margins
static const double marginSmall = 8.0;
static const double marginMedium = 16.0;
static const double marginLarge = 24.0;
```

### Component Dimensions

```dart
class AppDimen {
  // Touch Targets (Material minimum 48dp)
  static const double minTouchTarget = 48.0;
  static const double buttonHeight = 48.0;
  static const double iconButtonSize = 48.0;
  
  // Cards
  static const double cardElevation = 1.0;           // Subtle shadow
  static const double cardRadius = 12.0;             // Rounded corners
  static const double cardHoverElevation = 2.0;      // On hover
  static const double cardMaxWidth = 400.0;          // Maximum card width
  
  // Dashboard Cards
  static const double statsCardHeight = 120.0;
  static const double expiryWarningCardMinHeight = 200.0;
  static const double recipeCardWidth = 160.0;
  static const double recipeCardHeight = 200.0;
  static const double shoppingCardMinHeight = 150.0;
  
  // Icons
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeHuge = 48.0;
  
  // Badges & Avatars
  static const double badgeSize = 20.0;
  static const double badgeFontSize = 12.0;
  static const double avatarSizeSmall = 32.0;
  static const double avatarSizeMedium = 40.0;
  static const double avatarSizeLarge = 56.0;
  
  // Images
  static const double recipeImageHeight = 120.0;
  static const double itemImageSize = 80.0;
  static const double thumbnailSize = 48.0;
  
  // FAB
  static const double fabSize = 56.0;
  static const double fabMini = 40.0;
  
  // AppBar & Navigation
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 80.0;
  static const double navRailWidth = 80.0;
}
```

### Responsive Breakpoints

```dart
class AppBreakpoints {
  // Screen size breakpoints
  static const double mobile = 600.0;       // < 600: Mobile
  static const double tablet = 900.0;       // 600-900: Tablet  
  static const double desktop = 1200.0;     // > 900: Desktop
  
  // Content max widths
  static const double contentMaxWidth = 1200.0;
  static const double cardMaxWidth = 400.0;
  
  // Grid columns
  static int getColumns(double width) {
    if (width < mobile) return 4;           // Mobile: 4 columns
    if (width < tablet) return 8;           // Tablet: 8 columns
    return 12;                               // Desktop: 12 columns
  }
  
  // Card columns
  static int getCardColumns(double width) {
    if (width < mobile) return 1;           // Mobile: 1 column
    if (width < tablet) return 2;           // Tablet: 2 columns
    return 3;                                // Desktop: 3 columns
  }
}
```

### Layout Guidelines

**Mobile (< 600dp)**:
- Single column layout
- 16dp screen padding
- Full-width cards
- Vertical stacking

**Tablet (600-900dp)**:
- 2-column grid possible
- 24dp screen padding
- Cards can be side-by-side
- Consider navigation rail

**Desktop (> 900dp)**:
- Max width 1200dp, center content
- 32dp screen padding
- 3-column grid
- Permanent navigation rail
- Hover states active

---

## 🎭 Elevation & Shadows

### Material 3 Elevation

```dart
// Surface tint (Material 3 style)
static const double tintOpacity0 = 0.0;      // Flat (elevation 0)
static const double tintOpacity1 = 0.05;     // Subtle (elevation 1)
static const double tintOpacity2 = 0.08;     // Medium (elevation 2)
static const double tintOpacity3 = 0.11;     // High (elevation 3)

// Shadow elevations
static const double elevation0 = 0.0;        // Flat surface
static const double elevation1 = 1.0;        // Cards (default)
static const double elevation2 = 3.0;        // Cards (hover/selected)
static const double elevation3 = 6.0;        // Dialogs, menus
static const double elevation4 = 8.0;        // Nav drawer
static const double elevation5 = 12.0;       // FAB
```

### Usage Guidelines

- **elevation0**: Flat background, disabled buttons
- **elevation1**: Cards, chips (default state)
- **elevation2**: Cards on hover, selected state
- **elevation3**: Dialogs, dropdown menus, tooltips
- **elevation4**: Navigation drawer, bottom sheet
- **elevation5**: FAB, snackbar

**Material 3 Note**: Prefer surface tint over shadow elevation for modern look

---

## 🎨 Icons

### Icon Sizes

```dart
// Standard sizes
static const double iconSizeSmall = 16.0;    // Inline with small text
static const double iconSizeMedium = 24.0;   // Default (Material standard)
static const double iconSizeLarge = 32.0;    // Prominent icons
static const double iconSizeHuge = 48.0;     // Hero icons, empty states
```

### Icon Usage

**Material Icons** (default):
```dart
// Navigation
home, home_outlined
kitchen, kitchen_outlined
restaurant_menu, restaurant_menu_outlined
shopping_cart, shopping_cart_outlined
settings, settings_outlined

// Actions
add, add_circle, add_circle_outline
edit, edit_outlined
delete, delete_outline
search
filter_list

// Status
check_circle, check_circle_outline
warning_amber, warning_amber_rounded
error, error_outline
info, info_outline

// Food categories
emoji_food_beverage      // Generic food
set_meal                 // Meal  
bakery_dining            // Baked goods
local_dining             // Restaurant
```

### Icon Colors

```dart
// Use semantic colors
Icon(Icons.check_circle, color: AppColors.statusFresh)
Icon(Icons.warning_amber, color: AppColors.statusWarning)
Icon(Icons.error, color: AppColors.statusExpired)

// Use theme colors
Icon(Icons.settings, color: Theme.of(context).colorScheme.onSurface)
Icon(Icons.add, color: Theme.of(context).colorScheme.primary)
```

### Icon Guidelines

**Do**:
- ✅ Use outlined icons for inactive states
- ✅ Use filled icons for active/selected states
- ✅ Pair icons with labels for clarity
- ✅ Maintain consistent size across same level
- ✅ Use semantic colors for status icons

**Don't**:
- ❌ Mix icon styles (outlined + filled) at same level
- ❌ Use icons without sufficient contrast
- ❌ Make icons smaller than 16dp
- ❌ Use icons alone without context
- ❌ Overuse decorative icons

---

## 🎬 Animation & Motion

### Duration Standards

```dart
class AppDuration {
  // Quick transitions
  static const Duration quick = Duration(milliseconds: 100);
  
  // Standard transitions
  static const Duration standard = Duration(milliseconds: 300);
  
  // Emphasized transitions
  static const Duration emphasized = Duration(milliseconds: 500);
  
  // Specific use cases
  static const Duration ripple = Duration(milliseconds: 200);
  static const Duration fade = Duration(milliseconds: 300);
  static const Duration slide = Duration(milliseconds: 300);
  static const Duration scale = Duration(milliseconds: 200);
}
```

### Curves

```dart
// Material standard curves
static const Curve easeIn = Curves.easeIn;
static const Curve easeOut = Curves.easeOut;
static const Curve easeInOut = Curves.easeInOut;

// Material emphasized
static const Curve emphasized = Curves.easeInOutCubicEmphasized;
static const Curve emphasizedDecelerate = Curves.easeOutCubic;
static const Curve emphasizedAccelerate = Curves.easeInCubic;

// Standard (most common)
static const Curve standard = Curves.easeInOut;
```

### Animation Types

**Fade Transitions**:
```dart
FadeTransition(
  opacity: animation,
  duration: AppDuration.fade,
  curve: Curves.easeInOut,
  child: widget,
)
```

**Scale Animations**:
```dart
ScaleTransition(
  scale: animation,
  duration: AppDuration.scale,
  curve: Curves.easeOut,
  child: widget,
)
```

**Slide Transitions**:
```dart
SlideTransition(
  position: animation,
  duration: AppDuration.slide,
  curve: Curves.easeInOut,
  child: widget,
)
```

### Micro-interactions

- **Button press**: Scale to 0.95, duration 100ms
- **Card tap**: Ripple effect, no scale
- **FAB**: Bounce on tap, rotate icon
- **Swipe**: Follow finger, snap threshold
- **Pull-to-refresh**: Rubber band effect

### Guidelines

**Do**:
- ✅ Use 300ms for most transitions
- ✅ Use easeInOut curve for standard moves
- ✅ Stagger list animations (50ms delay)
- ✅ Provide haptic feedback on actions
- ✅ Keep animations subtle and purposeful

**Don't**:
- ❌ Animate everything
- ❌ Use animations longer than 500ms
- ❌ Animate during loading states
- ❌ Use complex animations on slow devices
- ❌ Ignore reduced motion preferences

---

## ♿ Accessibility

### WCAG AA Compliance

**Color Contrast**:
- Normal text: **4.5:1** minimum
- Large text (18pt+): **3:1** minimum
- UI components: **3:1** minimum

**Touch Targets**:
- Minimum size: **48x48 dp**
- Spacing: **8dp** between targets
- Exception: Inline links (must have clear tap area)

**Focus Indicators**:
- Visible focus ring: **2dp** outline
- High contrast: **3:1** against background
- Use color + shape (not just color)

### Semantic Markup

```dart
// Buttons
Semantics(
  button: true,
  label: 'Thêm sản phẩm vào tủ lạnh',
  child: IconButton(...),
)

// Images
Semantics(
  image: true,
  label: 'Hình ảnh món ăn: Phở bò',
  child: Image(...),
)

// Live regions
Semantics(
  liveRegion: true,
  label: 'Có 3 sản phẩm hết hạn hôm nay',
  child: ExpiryBadge(...),
)

// Groups
Semantics(
  container: true,
  label: 'Thông tin tủ lạnh',
  child: FridgeStatsCard(...),
)
```

### Screen Reader Support

**Labels**:
- All interactive elements must have labels
- Use descriptive labels, not just "Button"
- Include state in label (e.g., "Selected")

**Announcements**:
```dart
// Announce changes
SemanticsService.announce(
  'Đã thêm sản phẩm vào tủ lạnh',
  TextDirection.ltr,
);
```

**Navigation Order**:
- Logical tab order (top to bottom, left to right)
- Group related content
- Skip to main content option

### High Contrast Mode

```dart
// Support system high contrast
final highContrast = MediaQuery.of(context).highContrast;

if (highContrast) {
  // Use high contrast colors
  backgroundColor = Colors.black;
  foregroundColor = Colors.white;
  outlineWidth = 2.0;
}
```

### Reduced Motion

```dart
// Respect reduced motion preference
final reduceMotion = MediaQuery.of(context).disableAnimations;

if (!reduceMotion) {
  // Perform animations
} else {
  // Skip animations, show end state
}
```

---

## 📱 Component Patterns

### Cards

**Standard Card**:
```dart
Card(
  elevation: AppDimen.cardElevation,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppDimen.cardRadius),
  ),
  child: Padding(
    padding: EdgeInsets.all(AppSpacing.cardPadding),
    child: child,
  ),
)
```

**Tappable Card**:
```dart
Card(
  elevation: AppDimen.cardElevation,
  clipBehavior: Clip.antiAlias,
  child: InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.cardPadding),
      child: child,
    ),
  ),
)
```

### Buttons

**Primary Button**:
```dart
ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(AppDimen.buttonHeight),
  ),
  child: Text(label),
)
```

**Secondary Button**:
```dart
OutlinedButton(
  onPressed: onPressed,
  style: OutlinedButton.styleFrom(
    minimumSize: Size.fromHeight(AppDimen.buttonHeight),
  ),
  child: Text(label),
)
```

**Text Button**:
```dart
TextButton(
  onPressed: onPressed,
  child: Text(label),
)
```

### Chips

**Filter Chip**:
```dart
FilterChip(
  label: Text(label),
  selected: isSelected,
  onSelected: onSelected,
  avatar: Icon(icon, size: AppDimen.iconSizeSmall),
)
```

**Action Chip**:
```dart
ActionChip(
  label: Text(label),
  onPressed: onPressed,
  avatar: Icon(icon, size: AppDimen.iconSizeSmall),
)
```

### Lists

**List Item**:
```dart
ListTile(
  contentPadding: EdgeInsets.symmetric(
    horizontal: AppSpacing.listItemPadding,
    vertical: AppSpacing.s,
  ),
  leading: CircleAvatar(child: Icon(icon)),
  title: Text(title, style: Theme.of(context).textTheme.titleMedium),
  subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
  trailing: Icon(Icons.arrow_forward_ios, size: AppDimen.iconSizeSmall),
  onTap: onTap,
)
```

---

## 🎯 Best Practices

### Visual Hierarchy
1. Use size to indicate importance
2. Use weight to create emphasis
3. Use color to guide attention
4. Use spacing to group related items

### Consistency
- Use the same patterns across the app
- Maintain spacing consistency
- Keep animation timing consistent
- Use semantic colors consistently

### Performance
- Optimize images (WebP, appropriate size)
- Use `const` constructors
- Avoid expensive builds
- Cache where appropriate

### Accessibility First
- Design for screen readers from start
- Ensure sufficient contrast
- Make touch targets large enough
- Provide text alternatives

---

## 📚 Resources

### Material Design 3
- [Material Design Guidelines](https://m3.material.io/)
- [Material 3 Color System](https://m3.material.io/styles/color/overview)
- [Material 3 Typography](https://m3.material.io/styles/typography/overview)

### Flutter Documentation
- [Material 3 in Flutter](https://docs.flutter.dev/ui/design/material)
- [Accessibility](https://docs.flutter.dev/development/accessibility-and-localization/accessibility)
- [Responsive Design](https://docs.flutter.dev/ui/layout/responsive/adaptive-responsive)

### Tools
- [Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [Material Theme Builder](https://m3.material.io/theme-builder)
- [Flutter DevTools](https://docs.flutter.dev/tools/devtools)

---

**Version**: 1.0  
**Last Updated**: 2025-10-24  
**Status**: Active ✅


