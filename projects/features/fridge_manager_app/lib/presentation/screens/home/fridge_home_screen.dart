import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/dashboard_cards/fridge_stats_card.dart';
import '../../widgets/dashboard_cards/expiry_warning_card.dart';
import '../../widgets/dashboard_cards/recipe_suggestion_card.dart';
import '../../widgets/dashboard_cards/shopping_list_card.dart';
import '../../widgets/dashboard_cards/medicine_app_card.dart';
import '../../providers/home_providers.dart';

/// Home screen for FridgeMate app
///
/// Displays dashboard with:
/// - Fridge stats card
/// - Expiry warning card
/// - Recipe suggestions
/// - Shopping list preview
/// - Medicine app card
class FridgeHomeScreen extends ConsumerStatefulWidget {
  const FridgeHomeScreen({super.key});

  @override
  ConsumerState<FridgeHomeScreen> createState() => _FridgeHomeScreenState();
}

class _FridgeHomeScreenState extends ConsumerState<FridgeHomeScreen> {
  void _onBottomNavTap(int index) {
    // Update selected index in ViewModel
    ref.read(fridgeHomeViewModelProvider.notifier).updateBottomNavIndex(index);

    // Navigate to different screens based on index
    switch (index) {
      case 0:
        // Already on home screen
        break;
      case 1:
        _navigateToFridge();
        break;
      case 2:
        _navigateToRecipes();
        break;
      case 3:
        _navigateToShopping();
        break;
      case 4:
        _navigateToSettings();
        break;
    }
  }

  // Navigation methods
  void _navigateToFridge() {
    context.pushNamed('inventory');
  }

  void _navigateToRecipes() {
    context.pushNamed('recipes');
  }

  void _navigateToShopping() {
    context.pushNamed('shopping-list');
  }

  void _navigateToMedicineList() {
    context.pushNamed('medicine-list');
  }

  void _navigateToDesignSystemDemo() {
    context.pushNamed('design-system-demo');
  }

  void _navigateToSettings() {
    _showPlaceholderMessage('Đang mở màn hình Cài đặt...');
    // TODO: Navigator.push to SettingsScreen
  }

  void _navigateToNotifications() {
    _showPlaceholderMessage('Đang mở Thông báo...');
    // TODO: Navigator.push to NotificationsScreen
  }

  void _navigateToExpiringItems() {
    _showPlaceholderMessage('Đang mở danh sách sản phẩm sắp hết hạn...');
    // TODO: Navigator.push to ExpiringItemsScreen
  }

  void _navigateToRecipeDetail(Recipe recipe) {
    _showPlaceholderMessage('Đang mở công thức: ${recipe.name}');
    // TODO: Navigator.push to RecipeDetailScreen with recipe.id
  }

  void _navigateToAddToShopping() {
    _showPlaceholderMessage('Đang mở form thêm vào danh sách mua sắm...');
    // TODO: Navigator.push to AddShoppingItemScreen or show dialog
  }

  void _showQuickAddDialog() {
    _showPlaceholderMessage('Đang mở form thêm nhanh...');
    // TODO: Show quick add dialog
  }

  void _showPlaceholderMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fridgeHomeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FridgeMate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette_outlined),
            onPressed: _navigateToDesignSystemDemo,
            tooltip: 'Design System Demo',
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: _navigateToNotifications,
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: _navigateToSettings,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(fridgeHomeViewModelProvider.notifier)
              .refreshDashboard();
        },
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.errorMessage != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(state.errorMessage!),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(fridgeHomeViewModelProvider.notifier)
                            .loadDashboardData();
                      },
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Welcome section
                  Text(
                    'Xin chào! 👋',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hôm nay bạn muốn nấu gì?',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),

                  // Fridge Stats Card
                  FridgeStatsCard(
                    itemCount: state.fridgeItemCount,
                    onTap: _navigateToFridge,
                  ),
                  const SizedBox(height: 16),

                  // Expiry Warning Card
                  ExpiryWarningCard(
                    todayCount: state.todayExpiryCount,
                    threeDaysCount: state.threeDaysExpiryCount,
                    weekCount: state.weekExpiryCount,
                    previewItems: state.expiringItems,
                    onViewAll: _navigateToExpiringItems,
                  ),
                  const SizedBox(height: 16),

                  // Recipe Suggestions Card
                  RecipeSuggestionCard(
                    recipes: state.suggestedRecipes,
                    onRecipeTap: _navigateToRecipeDetail,
                  ),
                  const SizedBox(height: 16),

                  // Shopping List Card
                  ShoppingListCard(
                    itemCount: state.shoppingItemCount,
                    previewItems: state.shoppingPreviewItems,
                    onViewAll: _navigateToShopping,
                    onQuickAdd: _navigateToAddToShopping,
                  ),
                  const SizedBox(height: 16),

                  // Medicine App Card
                  MedicineAppCard(onTap: _navigateToMedicineList),
                  const SizedBox(height: 80), // Space for FAB
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: _showQuickAddDialog,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.selectedBottomNavIndex,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen_outlined),
            activeIcon: Icon(Icons.kitchen),
            label: 'Tủ lạnh',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined),
            activeIcon: Icon(Icons.restaurant_menu),
            label: 'Thực đơn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Mua sắm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}
