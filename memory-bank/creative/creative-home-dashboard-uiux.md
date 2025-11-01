# 🎨 CREATIVE PHASE: FridgeMate UI/UX Design System

**Component**: Home Dashboard & Complete App UI/UX  
**Type**: UI/UX Design  
**Date**: 2025-10-24  
**Complexity Level**: 3 - Intermediate Feature

---

## 📌 CREATIVE PHASE START: UI/UX Design System

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 1️⃣ PROBLEM STATEMENT

### Description
Cần thiết kế một hệ thống UI/UX hoàn chỉnh cho ứng dụng FridgeMate theo Phase 1 Sitemap, đảm bảo:
- **Intuitive**: Dễ sử dụng, user-friendly
- **Consistent**: Nhất quán trong toàn bộ app
- **Accessible**: Tuân thủ WCAG AA
- **Modern**: Theo Material Design 3
- **Offline-first**: Tối ưu cho offline experience

### Requirements

#### Functional Requirements
- 5 màn hình chính: Home, Tủ lạnh, Thực đơn, Mua sắm, Cài đặt
- Bottom Navigation với 5 tabs
- Floating Action Button với Quick Actions
- Dashboard cards cho trang chủ:
  - Tủ lạnh stats
  - Cảnh báo hết hạn
  - Gợi ý món ăn
  - Danh sách mua sắm
- Responsive design (mobile-first)

#### Non-Functional Requirements
- Load time < 1 second
- 60fps animations
- Touch targets ≥ 48dp
- Color contrast ratio ≥ 4.5:1 (WCAG AA)
- Support dark/light theme

### Constraints
- Flutter Material 3 framework
- Phải hoạt động offline
- Target mobile devices primarily
- Cần support tablet/desktop (responsive)

### User Personas

**Persona 1: Gia đình bận rộn**
- **Age**: 30-45
- **Tech savvy**: Medium
- **Goals**: Quản lý thực phẩm hiệu quả, giảm lãng phí
- **Pain points**: Quên sản phẩm trong tủ lạnh, không biết nấu gì

**Persona 2: Người sống một mình**
- **Age**: 25-35
- **Tech savvy**: High
- **Goals**: Theo dõi thực phẩm, tìm công thức nhanh
- **Pain points**: Mua thừa, thực phẩm hỏng

**Persona 3: Người cao tuổi**
- **Age**: 55+
- **Tech savvy**: Low
- **Goals**: Nhắc nhở thuốc, theo dõi hạn sử dụng
- **Pain points**: Khó sử dụng app phức tạp, chữ nhỏ

---

## 2️⃣ UI/UX DESIGN OPTIONS

### Option A: Card-Based Dashboard (Material 3 Standard)

**Description**: Dashboard sử dụng Material 3 Cards với elevation và spacing chuẩn, layout vertical scroll

**Layout Structure**:
```
AppBar (Gradient)
├── Title: "FridgeMate"
└── Actions: Notifications, Settings

Body (ScrollView)
├── Fridge Stats Card (Full width)
│   ├── Icon + Number + Label
│   └── Tap to navigate
│
├── Expiry Warning Card (Full width)
│   ├── Header: "Sắp hết hạn" + Count badge
│   ├── Status breakdown (Today/3 days/1 week)
│   └── Preview list (Top 3 items)
│
├── Recipe Suggestions Card (Full width)
│   ├── Header: "Gợi ý món hôm nay"
│   └── Horizontal scroll (2-3 recipe cards)
│       ├── Image
│       ├── Title
│       ├── Match % badge
│       └── Time + Servings
│
└── Shopping List Card (Full width)
    ├── Header: "Danh sách mua sắm" + Count
    ├── Preview (Top 3 items)
    └── Quick Add button

FAB (Bottom Right)
└── Speed Dial Menu
    ├── Add to Fridge
    ├── Find Recipe
    └── Add to Shopping

Bottom Navigation
🏠 Home | 🧊 Fridge | 🍽️ Menu | 🛒 Shopping | ⚙️ Settings
```

**Visual Characteristics**:
- Material 3 Cards với surface tint
- 16dp spacing giữa cards
- 8dp corner radius
- Subtle shadows (elevation 1-2)
- Primary color: Teal (#00897B)
- Secondary color: Fresh Green (#66BB6A)
- Accent color: Orange (#FF9800) cho warnings

**Pros**:
- ✅ Standard Material Design - familiar
- ✅ Clear visual hierarchy
- ✅ Easy to implement
- ✅ Responsive out of the box
- ✅ Accessible by default

**Cons**:
- ❌ Có thể cảm giác generic
- ❌ Nhiều white space (có thể cải thiện)
- ❌ Horizontal scroll recipe cards có thể miss

**Implementation Complexity**: Low-Medium
**Estimated Time**: 2-3 days

---

### Option B: Compact Grid Dashboard (Dense Information)

**Description**: Dashboard sử dụng grid layout 2 columns cho maximum information density

**Layout Structure**:
```
AppBar (Solid Color)
└── Title + Actions

Body (ScrollView)
├── Row 1 (2 columns)
│   ├── Fridge Stats Card (50%)
│   └── Expiry Warning Card (50%)
│
├── Recipe Suggestions (Full width)
│   └── Grid layout 2x2
│
└── Shopping List Card (Full width)

FAB (Expandable)
Bottom Navigation (Same)
```

**Visual Characteristics**:
- Compact cards với less padding
- 8dp spacing giữa cards
- 12dp corner radius
- Grid layout 2 columns
- Denser typography
- More information visible

**Pros**:
- ✅ More information visible
- ✅ Less scrolling needed
- ✅ Efficient use of space
- ✅ Good for power users

**Cons**:
- ❌ Có thể overwhelming cho người cao tuổi
- ❌ Touch targets có thể nhỏ
- ❌ Khó scan quickly
- ❌ Accessibility concerns
- ❌ Not ideal cho small screens

**Implementation Complexity**: Medium
**Estimated Time**: 3-4 days

---

### Option C: Progressive Disclosure Dashboard (Hybrid)

**Description**: Dashboard kết hợp card layout với progressive disclosure, prioritize critical info

**Layout Structure**:
```
AppBar (Custom với gradient)
├── Title
└── Profile/Settings

Hero Section (Collapsible)
├── Daily Summary Card
│   ├── Fridge count
│   ├── Expiring count
│   └── Quick metrics
└── Collapse/Expand button

Main Content
├── Priority Section
│   ├── Urgent Warnings (if any) - Full width alert
│   └── Today's Suggestions - Carousel
│
└── Secondary Sections (Collapsible)
    ├── Fridge Management - Expandable
    ├── Recipes - Expandable
    └── Shopping - Expandable

FAB (Contextual)
└── Changes based on scroll position

Bottom Navigation (Same)
```

**Visual Characteristics**:
- Hero section với gradient background
- Collapsible sections
- Priority-based layout
- Contextual FAB
- Animations cho expand/collapse
- Smart spacing

**Pros**:
- ✅ Prioritizes important information
- ✅ Reduces cognitive load
- ✅ Engaging animations
- ✅ Adapts to user needs
- ✅ Modern and fresh

**Cons**:
- ❌ More complex implementation
- ❌ Requires smart logic for priority
- ❌ Animations can impact performance
- ❌ Steeper learning curve
- ❌ More state management

**Implementation Complexity**: High
**Estimated Time**: 5-6 days

---

## 3️⃣ ANALYSIS & EVALUATION

### Evaluation Criteria

| Criterion | Option A (Card-Based) | Option B (Grid) | Option C (Progressive) |
|-----------|---------------------|-----------------|----------------------|
| **Usability** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Learnability** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| **Efficiency** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Accessibility (A11y)** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Aesthetics** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Implementation** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Responsive** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Persona Fit** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **TOTAL** | **41/45** | **33/45** | **37/45** |

### Key Insights

#### For Option A (Card-Based):
- **Best for accessibility**: Clear hierarchy, standard patterns
- **Best for personas**: Phù hợp với cả 3 personas, đặc biệt người cao tuổi
- **Easiest to implement**: Material 3 components có sẵn
- **Most familiar**: Users đã quen với pattern này
- **Trade-off**: Less innovative, có thể cảm giác "generic"

#### For Option B (Grid):
- **Best for information density**: Show nhiều info nhất
- **Good for power users**: Persona 2 sẽ thích
- **Concerns**: Persona 3 sẽ gặp khó khăn
- **Accessibility issues**: Touch targets nhỏ, khó scan
- **Trade-off**: Efficiency vs Usability

#### For Option C (Progressive):
- **Most modern**: Fresh và engaging
- **Adaptive**: Thay đổi theo context
- **Complex implementation**: Cần nhiều state management
- **Animation concerns**: Có thể ảnh hưởng performance
- **Trade-off**: Innovation vs Complexity

### Persona Analysis

**Persona 1 (Gia đình bận rộn)**:
- Option A: ⭐⭐⭐⭐⭐ (Clear, quick scan)
- Option B: ⭐⭐⭐ (Too dense)
- Option C: ⭐⭐⭐⭐ (Good priorities)

**Persona 2 (Người trẻ tech-savvy)**:
- Option A: ⭐⭐⭐⭐ (Good but standard)
- Option B: ⭐⭐⭐⭐⭐ (Efficient)
- Option C: ⭐⭐⭐⭐⭐ (Modern)

**Persona 3 (Người cao tuổi)**:
- Option A: ⭐⭐⭐⭐⭐ (Easiest)
- Option B: ⭐⭐ (Too complex)
- Option C: ⭐⭐⭐ (May confuse)

---

## 4️⃣ DECISION

### Selected: **Option A - Card-Based Dashboard** (với enhancements)

### Rationale

**Primary Reasons**:
1. **Best accessibility**: Đạt WCAG AA, phù hợp mọi người dùng
2. **Fastest implementation**: 2-3 days vs 5-6 days
3. **Material 3 alignment**: Leverage existing components
4. **Persona fit**: Phù hợp với cả 3 personas, đặc biệt Persona 3
5. **Performance**: Guaranteed 60fps, minimal animations
6. **Maintainability**: Standard patterns, dễ maintain

**Enhancements to Add**:
- **Subtle animations**: Fade-in cards, ripple effects
- **Custom colors**: Teal/Green theme cho fresh feeling
- **Smart spacing**: Optimize white space
- **Micro-interactions**: Tap feedback, loading states
- **Empty states**: Onboarding khi chưa có data

**Why Not Others**:
- Option B: Accessibility concerns, không phù hợp Persona 3
- Option C: Too complex cho Phase 1, có thể consider Phase 2

---

## 5️⃣ DETAILED DESIGN SPECIFICATIONS

### 🎨 Visual Design System

#### Color Palette (Material 3)

**Primary Colors**:
```dart
// Light Theme
primary: Color(0xFF00897B),          // Teal 600 - Main brand
onPrimary: Color(0xFFFFFFFF),        // White text on primary
primaryContainer: Color(0xFFB2DFDB), // Teal 100 - Container
onPrimaryContainer: Color(0xFF004D40), // Dark teal text

// Secondary Colors
secondary: Color(0xFF66BB6A),         // Green 400 - Fresh/Healthy
onSecondary: Color(0xFFFFFFFF),       // White
secondaryContainer: Color(0xFFC8E6C9), // Green 100
onSecondaryContainer: Color(0xFF1B5E20), // Dark green

// Tertiary (Accent)
tertiary: Color(0xFFFF9800),          // Orange 500 - Warnings/CTA
onTertiary: Color(0xFFFFFFFF),
tertiaryContainer: Color(0xFFFFE0B2),  // Orange 100
onTertiaryContainer: Color(0xFFE65100), // Dark orange
```

**Semantic Status Colors**:
```dart
// Fresh/Good status
statusFresh: Color(0xFF4CAF50),       // Green 500
statusFreshBg: Color(0xFFE8F5E9),     // Green 50

// Expiring Soon (Warning)
statusWarning: Color(0xFFFF9800),     // Orange 500
statusWarningBg: Color(0xFFFFF3E0),   // Orange 50

// Expired (Error)
statusExpired: Color(0xFFF44336),     // Red 500
statusExpiredBg: Color(0xFFFFEBEE),   // Red 50

// Info
statusInfo: Color(0xFF2196F3),        // Blue 500
statusInfoBg: Color(0xFFE3F2FD),      // Blue 50
```

**Neutral Colors**:
```dart
background: Color(0xFFFAFAFA),        // Grey 50
surface: Color(0xFFFFFFFF),           // White
surfaceVariant: Color(0xFFF5F5F5),    // Grey 100

outline: Color(0xFFBDBDBD),           // Grey 400
outlineVariant: Color(0xFFE0E0E0),    // Grey 300

onBackground: Color(0xFF212121),      // Grey 900
onSurface: Color(0xFF424242),         // Grey 800
onSurfaceVariant: Color(0xFF757575),  // Grey 600
```

**Dark Theme** (Mirror structure):
```dart
primary: Color(0xFF4DB6AC),           // Teal 300
background: Color(0xFF121212),        // Dark grey
surface: Color(0xFF1E1E1E),           // Elevated surface
// ... (follow Material 3 dark theme spec)
```

#### Typography System

**Font Family**: Roboto (Material Design default)

**Type Scale** (Material 3):
```dart
// Display - Large headings
displayLarge: TextStyle(
  fontSize: 57.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.25,
  height: 1.12,
),
displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w400),
displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w400),

// Headline - Section headers
headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),

// Title - Card headers, dialogs
titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),

// Body - Main content
bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4),

// Label - Buttons, tabs
labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
```

**FridgeMate-Specific Typography**:
```dart
// Dashboard
dashboardTitle: titleLarge,           // Card headers
dashboardValue: displayMedium,        // Big numbers (item count)
dashboardLabel: bodyMedium,           // Labels

// Items
itemName: titleMedium,                // Item names in lists
itemCategory: labelMedium,            // Category chips
itemExpiry: bodySmall,                // Expiry dates
itemExpiryWarning: labelSmall.copyWith(
  fontWeight: FontWeight.w700,        // Bold for warnings
  color: statusWarning,
),

// Recipe
recipeTitle: titleLarge,              // Recipe names
recipeDescription: bodyMedium,        // Descriptions
recipeMetadata: labelSmall,           // Time, servings
```

#### Spacing & Layout

**8dp Grid System**:
```dart
class AppSpacing {
  // Base unit
  static const double unit = 8.0;
  
  // Spacing scale
  static const double xs = 4.0;    // 0.5x
  static const double s = 8.0;     // 1x - base
  static const double m = 12.0;    // 1.5x
  static const double l = 16.0;    // 2x - default padding
  static const double xl = 20.0;   // 2.5x
  static const double xxl = 24.0;  // 3x
  static const double xxxl = 32.0; // 4x
  static const double huge = 48.0; // 6x
  
  // Specific use cases
  static const double cardPadding = l;        // 16dp
  static const double cardSpacing = l;        // 16dp between cards
  static const double screenPadding = l;      // 16dp screen edges
  static const double listItemPadding = l;    // 16dp list items
  static const double iconSpacing = s;        // 8dp around icons
  static const double chipSpacing = s;        // 8dp between chips
}
```

**Component Dimensions**:
```dart
class AppDimen {
  // Touch targets (Minimum 48dp)
  static const double minTouchTarget = 48.0;
  
  // Cards
  static const double cardElevation = 1.0;          // Subtle
  static const double cardRadius = 12.0;            // Rounded corners
  static const double cardHoverElevation = 2.0;     // On hover
  
  // Dashboard specific
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
  
  // Avatar/Images
  static const double avatarSize = 40.0;
  static const double recipeImageHeight = 120.0;
  
  // Badges
  static const double badgeSize = 20.0;
  static const double badgeFontSize = 12.0;
  
  // FAB
  static const double fabSize = 56.0;
  static const double fabMini = 40.0;
  
  // Bottom nav
  static const double bottomNavHeight = 80.0;
}
```

**Responsive Breakpoints**:
```dart
class AppBreakpoints {
  static const double mobile = 600.0;      // < 600: Mobile
  static const double tablet = 900.0;      // 600-900: Tablet
  static const double desktop = 1200.0;    // > 900: Desktop
  
  // Grid columns
  static int getColumns(double width) {
    if (width < mobile) return 4;          // Mobile: 4 columns
    if (width < tablet) return 8;          // Tablet: 8 columns
    return 12;                              // Desktop: 12 columns
  }
}
```

#### Elevation & Shadows

**Material 3 Elevation System**:
```dart
// Surface tint opacity (Material 3 style)
static const double tintOpacity0 = 0.0;    // Flat
static const double tintOpacity1 = 0.05;   // Subtle
static const double tintOpacity2 = 0.08;
static const double tintOpacity3 = 0.11;

// Shadow elevations
static const double elevation0 = 0.0;      // Flat
static const double elevation1 = 1.0;      // Cards (default)
static const double elevation2 = 3.0;      // Cards (hover/active)
static const double elevation3 = 6.0;      // Dialogs, menus
static const double elevation4 = 8.0;      // Nav drawer
static const double elevation5 = 12.0;     // FAB
```

### 🧩 Component Specifications

#### 1. Dashboard Cards

**FridgeStatsCard**:
```dart
Widget FridgeStatsCard({
  required int itemCount,
  required VoidCallback onTap,
}) {
  return Card(
    elevation: AppDimen.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.cardRadius),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimen.cardRadius),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.cardPadding),
        child: Row(
          children: [
            // Icon section
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.kitchen,
                size: AppDimen.iconSizeLarge,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(width: AppSpacing.l),
            // Content section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$itemCount',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'Sản phẩm trong tủ lạnh',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              size: AppDimen.iconSizeSmall,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    ),
  );
}
```

**ExpiryWarningCard**:
```dart
Widget ExpiryWarningCard({
  required int todayCount,
  required int threeDaysCount,
  required int weekCount,
  required List<StorageItem> previewItems,
  required VoidCallback onViewAll,
}) {
  return Card(
    elevation: AppDimen.cardElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimen.cardRadius),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppColors.statusWarning),
              SizedBox(width: AppSpacing.s),
              Text('Sắp hết hạn', style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              Badge(
                label: Text('${todayCount + threeDaysCount + weekCount}'),
                backgroundColor: AppColors.statusWarning,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.l),
          
          // Status breakdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatusColumn(
                'Hôm nay',
                todayCount,
                AppColors.statusExpired,
              ),
              _buildStatusColumn(
                '3 ngày',
                threeDaysCount,
                AppColors.statusWarning,
              ),
              _buildStatusColumn(
                '1 tuần',
                weekCount,
                AppColors.statusInfo,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.l),
          
          // Preview list
          ...previewItems.take(3).map((item) => 
            _buildPreviewItem(item)
          ).toList(),
          
          // View all button
          TextButton(
            onPressed: onViewAll,
            child: Text('Xem tất cả'),
          ),
        ],
      ),
    ),
  );
}
```

**RecipeSuggestionCard**:
```dart
Widget RecipeSuggestionCard({
  required List<Recipe> recipes,
  required Function(Recipe) onRecipeTap,
}) {
  return Card(
    elevation: AppDimen.cardElevation,
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(Icons.restaurant_menu, color: AppColors.secondary),
              SizedBox(width: AppSpacing.s),
              Text('Gợi ý món hôm nay', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          SizedBox(height: AppSpacing.l),
          
          // Horizontal scroll recipes
          SizedBox(
            height: AppDimen.recipeCardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              separatorBuilder: (_, __) => SizedBox(width: AppSpacing.m),
              itemBuilder: (context, index) {
                return _buildRecipeCard(recipes[index], onRecipeTap);
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildRecipeCard(Recipe recipe, Function(Recipe) onTap) {
  return SizedBox(
    width: AppDimen.recipeCardWidth,
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(recipe),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.network(
              recipe.imageUrl ?? '',
              height: AppDimen.recipeImageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: AppDimen.recipeImageHeight,
                color: Colors.grey[300],
                child: Icon(Icons.restaurant),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Match badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.s,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.statusFreshBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${recipe.matchPercentage}% phù hợp',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.statusFresh,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs),
                  // Title
                  Text(
                    recipe.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  // Metadata
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14),
                      SizedBox(width: 4),
                      Text('${recipe.totalTime}\'', style: TextStyle(fontSize: 12)),
                      SizedBox(width: AppSpacing.s),
                      Icon(Icons.people, size: 14),
                      SizedBox(width: 4),
                      Text('${recipe.servings}', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
```

#### 2. Navigation Components

**Bottom Navigation Bar**:
```dart
Widget buildBottomNavigationBar() {
  return NavigationBar(
    height: AppDimen.bottomNavHeight,
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      NavigationDestination(
        icon: Icon(Icons.kitchen_outlined),
        selectedIcon: Icon(Icons.kitchen),
        label: 'Tủ lạnh',
      ),
      NavigationDestination(
        icon: Icon(Icons.restaurant_menu_outlined),
        selectedIcon: Icon(Icons.restaurant_menu),
        label: 'Thực đơn',
      ),
      NavigationDestination(
        icon: Icon(Icons.shopping_cart_outlined),
        selectedIcon: Icon(Icons.shopping_cart),
        label: 'Mua sắm',
      ),
      NavigationDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: 'Cài đặt',
      ),
    ],
  );
}
```

**Floating Action Button với Speed Dial**:
```dart
Widget buildFAB() {
  return SpeedDial(
    icon: Icons.add,
    activeIcon: Icons.close,
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    children: [
      SpeedDialChild(
        icon: Icons.kitchen,
        label: 'Thêm vào tủ lạnh',
        onTap: () => _navigateToAddItem(),
      ),
      SpeedDialChild(
        icon: Icons.restaurant_menu,
        label: 'Tìm công thức',
        onTap: () => _navigateToRecipes(),
      ),
      SpeedDialChild(
        icon: Icons.shopping_cart,
        label: 'Thêm vào mua sắm',
        onTap: () => _navigateToShoppingAdd(),
      ),
    ],
  );
}
```

### 📱 Screen Layouts

#### Home Dashboard Screen

**Mobile Layout** (< 600dp):
```
┌────────────────────────────┐
│ AppBar                      │ 56dp
│ "FridgeMate"           🔔 ⚙ │
├────────────────────────────┤
│                             │
│ ScrollView (16dp padding)   │
│                             │
│ ┌─────────────────────────┐│
│ │ Fridge Stats Card       ││ 120dp
│ │ 🧊 45 sản phẩm     →   ││
│ └─────────────────────────┘│
│                             │ 16dp
│ ┌─────────────────────────┐│
│ │ Expiry Warning          ││
│ │ ⚠️ 12 sắp hết hạn   [12]││
│ │ Hôm nay   3 ngày  1 tuần││
│ │   3        5       4    ││
│ │                         ││
│ │ Preview items...        ││
│ │ Xem tất cả              ││
│ └─────────────────────────┘│
│                             │
│ ┌─────────────────────────┐│
│ │ Recipe Suggestions      ││
│ │ 🍽️ Gợi ý món hôm nay   ││
│ │                         ││
│ │ [Recipe 1] [Recipe 2]   ││ Horizontal scroll
│ └─────────────────────────┘│
│                             │
│ ┌─────────────────────────┐│
│ │ Shopping List           ││
│ │ 🛒 8 items              ││
│ │ Preview...              ││
│ │ [+ Quick Add]           ││
│ └─────────────────────────┘│
│                             │
└────────────────────────────┘
│                      [+FAB] │ 16dp from bottom
├────────────────────────────┤
│ Bottom Navigation           │ 80dp
│ 🏠 🧊 🍽️ 🛒 ⚙️             │
└────────────────────────────┘
```

**Tablet Layout** (600-900dp):
```
┌──────────────────────────────────────┐
│ AppBar                                │
├──────────────────────────────────────┤
│                                       │
│ ScrollView (24dp padding)             │
│                                       │
│ ┌─────────────┐  ┌─────────────────┐│
│ │ Stats Card  │  │ Expiry Warning  ││ 2 columns
│ └─────────────┘  └─────────────────┘│
│                                       │
│ ┌─────────────────────────────────┐  │
│ │ Recipe Suggestions (expanded)   │  │ Full width
│ └─────────────────────────────────┘  │
│                                       │
│ ┌─────────────────────────────────┐  │
│ │ Shopping List                   │  │
│ └─────────────────────────────────┘  │
│                                       │
└──────────────────────────────────────┘
│                                 [FAB] │
├──────────────────────────────────────┤
│ Bottom Navigation                     │
└──────────────────────────────────────┘
```

### 🎬 Animations & Transitions

#### Loading States
```dart
// Shimmer loading for cards
Widget buildShimmerCard() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Card(
      child: Container(height: 120),
    ),
  );
}

// Progressive loading
1. Show skeleton cards immediately
2. Fade in real content as data loads
3. Use staggered animation (50ms delay between cards)
```

#### Transitions
```dart
// Card tap animation
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => DetailScreen(),
    ),
  );
}

// Hero animation for images
Hero(
  tag: 'recipe-${recipe.id}',
  child: Image.network(recipe.imageUrl),
)

// Page transitions
PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(opacity: animation, child: child);
  },
  transitionDuration: Duration(milliseconds: 300),
)
```

#### Micro-interactions
- **Ripple effect**: All tappable elements
- **Scale animation**: Buttons on press (scale 0.95)
- **Bounce**: FAB on tap
- **Slide up**: Bottom sheets
- **Fade**: Dialogs

### ♿ Accessibility Features

#### WCAG AA Compliance
```dart
// Color contrast ratios
- Text on background: 4.5:1 minimum
- Large text (18pt+): 3:1 minimum
- Interactive elements: 3:1 minimum

// Touch targets
- Minimum size: 48x48 dp
- Spacing between targets: 8dp minimum

// Focus indicators
- Visible focus ring for keyboard navigation
- Color + icon for status (not just color)
```

#### Screen Reader Support
```dart
// Semantic labels
Semantics(
  label: 'Tủ lạnh có 45 sản phẩm. Nhấn để xem chi tiết.',
  child: FridgeStatsCard(...),
)

// Live regions for dynamic updates
Semantics(
  liveRegion: true,
  label: 'Có 3 sản phẩm hết hạn hôm nay',
  child: ExpiryBadge(...),
)

// Grouping related content
Semantics(
  container: true,
  label: 'Cảnh báo hết hạn',
  child: ExpiryWarningCard(...),
)
```

#### Keyboard Navigation
- Tab order logical (top to bottom, left to right)
- Enter/Space activates buttons
- Arrow keys for lists
- Escape closes dialogs

#### High Contrast Mode
```dart
// Support high contrast colors
ThemeData(
  highContrastTheme: ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.highContrastLight(),
  ),
)
```

### 📐 Layout Behavior

#### Responsive Adaptations

**Mobile Portrait** (< 600dp width):
- Single column layout
- Full-width cards
- Vertical scroll
- Bottom nav always visible
- FAB bottom-right

**Mobile Landscape** (< 600dp height):
- Same as portrait
- AppBar may hide on scroll (optional)
- FAB smaller

**Tablet Portrait** (600-900dp):
- 2-column grid for stats
- Larger card padding
- More horizontal space for recipe cards
- Navigation rail option (left side)

**Tablet Landscape** (600-900dp):
- 3-column grid possible
- Master-detail layout option
- Permanent navigation drawer

**Desktop** (> 900dp):
- Max width constraint (1200dp)
- Center content
- 3-column grid
- Permanent navigation rail
- Hover states for cards

### 🎯 Interaction Patterns

#### Pull-to-Refresh
```dart
RefreshIndicator(
  onRefresh: _handleRefresh,
  child: ListView(...),
)
```

#### Swipe Actions
```dart
Dismissible(
  key: Key(item.id),
  background: Container(color: Colors.red),
  onDismissed: (direction) => _deleteItem(item),
  child: ItemTile(item),
)
```

#### Long Press
```dart
GestureDetector(
  onLongPress: () => _showContextMenu(item),
  child: ItemTile(item),
)
```

#### Haptic Feedback
```dart
HapticFeedback.lightImpact(); // On button press
HapticFeedback.mediumImpact(); // On delete
HapticFeedback.heavyImpact(); // On error
```

### 🔍 Empty States & Error Handling

#### Empty State (No Data)
```dart
Widget buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inventory_2_outlined,
          size: 80,
          color: Colors.grey[400],
        ),
        SizedBox(height: AppSpacing.l),
        Text(
          'Tủ lạnh trống',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: AppSpacing.s),
        Text(
          'Thêm sản phẩm đầu tiên vào tủ lạnh',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xl),
        ElevatedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Thêm sản phẩm'),
          onPressed: () => _navigateToAddItem(),
        ),
      ],
    ),
  );
}
```

#### Error State
```dart
Widget buildErrorState(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 80,
          color: AppColors.statusExpired,
        ),
        SizedBox(height: AppSpacing.l),
        Text(
          'Có lỗi xảy ra',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: AppSpacing.s),
        Text(
          error,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xl),
        ElevatedButton(
          child: Text('Thử lại'),
          onPressed: () => _retry(),
        ),
      ],
    ),
  );
}
```

#### Loading State
```dart
Widget buildLoadingState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: AppSpacing.l),
        Text('Đang tải...'),
      ],
    ),
  );
}
```

---

## 6️⃣ IMPLEMENTATION GUIDELINES

### File Structure
```
lib/presentation/
├── screens/
│   └── home/
│       ├── fridge_home_screen.dart           # Main screen
│       ├── fridge_home_view_model.dart       # ViewModel
│       └── fridge_home_state.dart            # State
├── widgets/
│   ├── dashboard_cards/
│   │   ├── fridge_stats_card.dart
│   │   ├── expiry_warning_card.dart
│   │   ├── recipe_suggestion_card.dart
│   │   └── shopping_list_card.dart
│   ├── quick_actions/
│   │   └── home_quick_actions_fab.dart
│   └── common/
│       ├── loading_skeleton.dart
│       ├── empty_state.dart
│       └── error_state.dart
└── providers/
    └── home_providers.dart
```

### Implementation Phases

**Phase 1: Theme & Design System** (4 hours)
- [ ] Define color palette in theme
- [ ] Define typography scale
- [ ] Create spacing constants
- [ ] Setup Material 3 theme

**Phase 2: Basic Layout** (4 hours)
- [ ] Create home screen scaffold
- [ ] Add AppBar
- [ ] Add Bottom Navigation
- [ ] Setup ScrollView structure

**Phase 3: Dashboard Cards** (8 hours)
- [ ] FridgeStatsCard
- [ ] ExpiryWarningCard
- [ ] RecipeSuggestionCard
- [ ] ShoppingListCard

**Phase 4: Navigation & FAB** (4 hours)
- [ ] Setup routing
- [ ] Implement FAB speed dial
- [ ] Wire up navigation

**Phase 5: State Management** (4 hours)
- [ ] Create state classes
- [ ] Setup providers
- [ ] Implement loading/error states

**Phase 6: Polish** (4 hours)
- [ ] Add animations
- [ ] Implement empty states
- [ ] Add accessibility labels
- [ ] Test responsive layouts

**Total**: ~28 hours (~3.5 days)

### Code Quality Checklist
- [ ] Follow Flutter style guide
- [ ] Use const constructors where possible
- [ ] Extract magic numbers to constants
- [ ] Add semantic labels for accessibility
- [ ] Implement proper error handling
- [ ] Add loading states
- [ ] Test on multiple screen sizes
- [ ] Verify color contrast ratios
- [ ] Check touch target sizes
- [ ] Test with screen reader

---

## 7️⃣ VALIDATION & TESTING

### Design Validation
- [ ] Color contrast meets WCAG AA (4.5:1)
- [ ] Touch targets ≥ 48dp
- [ ] Typography scale consistent
- [ ] Spacing follows 8dp grid
- [ ] Elevation levels correct
- [ ] Responsive on all screen sizes

### User Testing Scenarios

**Scenario 1: First-time user**
- Open app for first time
- See empty state
- Add first item
- Check home dashboard updates

**Scenario 2: Daily user**
- Open app
- Quick scan dashboard
- Check expiring items
- Find recipe suggestion

**Scenario 3: Accessibility user**
- Navigate with screen reader
- Use keyboard only
- Test high contrast mode
- Verify semantic labels

### Performance Metrics
- [ ] Initial load < 1 second
- [ ] 60fps scrolling
- [ ] No jank in animations
- [ ] Memory usage < 100MB
- [ ] Battery impact minimal

---

## 8️⃣ NEXT STEPS

### After Home Dashboard
1. **Item List Screen**: Apply same design patterns
2. **Recipe Detail Screen**: Extend card design
3. **Add Item Form**: Design form components
4. **Shopping List**: Similar to home cards

### Future Enhancements (Phase 2+)
- [ ] Dark mode polish
- [ ] Custom themes
- [ ] Advanced animations
- [ ] Gesture shortcuts
- [ ] Widget support
- [ ] Watch app

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## ✅ CREATIVE PHASE VERIFICATION

- [x] Problem clearly defined
- [x] Multiple options considered (3 options)
- [x] Options analyzed with criteria
- [x] Decision made with rationale
- [x] Detailed specifications provided
- [x] Component specifications defined
- [x] Accessibility considered
- [x] Implementation guidelines included
- [x] Responsive design addressed
- [x] Testing plan included

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📌 **CREATIVE PHASE END**

**Status**: ✅ Complete  
**Selected Design**: Option A - Card-Based Dashboard (Material 3)  
**Ready for**: IMPLEMENT MODE  
**Estimated Implementation**: 3.5 days  
**Document Created**: `memory-bank/creative/creative-home-dashboard-uiux.md`

---

