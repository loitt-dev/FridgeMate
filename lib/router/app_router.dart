import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fridge_manager_app/presentation/screens/home/fridge_home_screen.dart';
import 'package:fridge_manager_app/presentation/screens/inventory/inventory_screen.dart';
import 'package:fridge_manager_app/presentation/screens/recipes/recipes_screen.dart';
import 'package:fridge_manager_app/presentation/screens/shopping_list/shopping_list_screen.dart';
import 'package:medicine_box_manager_app/presentation/screens/medicine_list/medicine_list_screen.dart';
import 'package:medicine_box_manager_app/presentation/screens/reminder/reminder_screen.dart';
import 'package:fridge_manager_app/presentation/screens/design_system/design_system_demo_screen.dart';

/// App Router Configuration
class AppRouter {
  static const String home = '/';
  static const String inventory = '/inventory';
  static const String recipes = '/recipes';
  static const String shoppingList = '/shopping-list';
  static const String medicineList = '/medicine-list';
  static const String reminder = '/reminder';
  static const String designSystemDemo = '/design-system-demo';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      // Fridge App Routes
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const FridgeHomeScreen(),
      ),
      GoRoute(
        path: inventory,
        name: 'inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
      GoRoute(
        path: recipes,
        name: 'recipes',
        builder: (context, state) => const RecipesScreen(),
      ),
      GoRoute(
        path: shoppingList,
        name: 'shopping-list',
        builder: (context, state) => const ShoppingListScreen(),
      ),

      // Design System Demo Route
      GoRoute(
        path: designSystemDemo,
        name: 'design-system-demo',
        builder: (context, state) => const DesignSystemDemoScreen(),
      ),

      // Medicine App Routes
      GoRoute(
        path: medicineList,
        name: 'medicine-list',
        builder: (context, state) => const MedicineListScreen(),
      ),
      GoRoute(
        path: reminder,
        name: 'reminder',
        builder: (context, state) => const ReminderScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Không tìm thấy trang: ${state.uri}')),
    ),
  );
}
