# Navigation Module

## 📋 Tổng Quan

Navigation module cung cấp routing system với go_router, route definitions, và navigation guards cho FridgeMate.

## 🎯 Nguyên Tắc

- **Declarative Routing**: Sử dụng go_router
- **Type Safe**: Type-safe navigation
- **Guards**: Authentication và permission guards
- **Modular**: Routes được organize theo features
- **No Business Logic**: Chỉ navigation logic

## 📁 Cấu Trúc

```
lib/
├── navigation.dart
├── routes/
│   ├── app_routes.dart             # Main app routes
│   ├── fridge_routes.dart          # Fridge app routes
│   └── medicine_routes.dart        # Medicine app routes
├── router/
│   └── app_router.dart             # go_router configuration
├── guards/
│   └── auth_guard.dart             # Authentication guard
└── services/
    └── navigation_service.dart     # Navigation service
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.0.0
  domain:
    path: ../../core/domain      # For auth check
  
  # ❌ NO get_it
```

## 📝 Sử Dụng

### Router Configuration

```dart
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      // Main app routes
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      
      // Fridge routes
      ...FridgeRoutes.routes,
      
      // Medicine routes
      ...MedicineRoutes.routes,
    ],
    redirect: (context, state) {
      // Global redirect logic
      return null;
    },
  );
}
```

### Route Definitions

```dart
class AppRoutes {
  static const String home = '/';
  static const String fridge = '/fridge';
  static const String medicine = '/medicine';
  static const String settings = '/settings';
}

class FridgeRoutes {
  static const String base = '/fridge';
  static const String home = '$base/home';
  static const String items = '$base/items';
  static const String itemDetail = '$base/items/:id';
  static const String addItem = '$base/items/add';
  static const String recipes = '$base/recipes';
  static const String shopping = '$base/shopping';
  
  static final List<RouteBase> routes = [
    GoRoute(
      path: home,
      builder: (context, state) => const FridgeHomeScreen(),
    ),
    GoRoute(
      path: items,
      builder: (context, state) => const FridgeItemsScreen(),
    ),
    GoRoute(
      path: itemDetail,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return FridgeItemDetailScreen(itemId: id);
      },
    ),
    GoRoute(
      path: addItem,
      builder: (context, state) => const FridgeAddItemScreen(),
    ),
    GoRoute(
      path: recipes,
      builder: (context, state) => const FridgeRecipesScreen(),
    ),
    GoRoute(
      path: shopping,
      builder: (context, state) => const FridgeShoppingScreen(),
    ),
  ];
}
```

### Navigation Guards

```dart
class AuthGuard {
  static String? redirect(BuildContext context, GoRouterState state) {
    // Check authentication status
    final isAuthenticated = _checkAuthStatus();
    
    if (!isAuthenticated && _requiresAuth(state.location)) {
      return AppRoutes.login;
    }
    
    return null;
  }
  
  static bool _requiresAuth(String location) {
    const protectedRoutes = [
      AppRoutes.fridge,
      AppRoutes.medicine,
      AppRoutes.settings,
    ];
    
    return protectedRoutes.any((route) => location.startsWith(route));
  }
  
  static bool _checkAuthStatus() {
    // Check auth status from domain
    // This would be implemented with actual auth logic
    return true; // For Phase 1, always return true
  }
}
```

### Navigation Service

```dart
class NavigationService {
  static final GoRouter _router = AppRouter.router;
  
  // Navigate to route
  static void go(String location, {Object? extra}) {
    _router.go(location, extra: extra);
  }
  
  // Push route
  static void push(String location, {Object? extra}) {
    _router.push(location, extra: extra);
  }
  
  // Pop current route
  static void pop([Object? result]) {
    _router.pop(result);
  }
  
  // Replace current route
  static void pushReplacement(String location, {Object? extra}) {
    _router.pushReplacement(location, extra: extra);
  }
  
  // Navigate with parameters
  static void goToItemDetail(String itemId) {
    go(FridgeRoutes.itemDetail.replaceAll(':id', itemId));
  }
  
  static void goToAddItem() {
    push(FridgeRoutes.addItem);
  }
}
```

### Route Extensions

```dart
extension NavigationExtensions on BuildContext {
  void goTo(String location, {Object? extra}) {
    NavigationService.go(location, extra: extra);
  }
  
  void pushTo(String location, {Object? extra}) {
    NavigationService.push(location, extra: extra);
  }
  
  void popRoute([Object? result]) {
    NavigationService.pop(result);
  }
  
  // Specific navigation methods
  void goToFridgeHome() => goTo(FridgeRoutes.home);
  void goToMedicineHome() => goTo(MedicineRoutes.home);
  void goToItemDetail(String itemId) => goTo(FridgeRoutes.itemDetail.replaceAll(':id', itemId));
}
```

## ✅ Validation

- [ ] Pure navigation - no business logic
- [ ] KHÔNG có get_it
- [ ] Routes được organize đúng
- [ ] Type-safe navigation
- [ ] Guards hoạt động
- [ ] Navigation service đầy đủ
- [ ] Context extensions tiện lợi

## 🚀 Phase 1 Features

- **Declarative Routing**: go_router setup
- **Route Organization**: Modular route structure
- **Navigation Guards**: Auth guards (sẵn sàng cho Phase 2)
- **Type Safety**: Type-safe navigation
- **Deep Linking**: Support deep links
- **Navigation Service**: Centralized navigation