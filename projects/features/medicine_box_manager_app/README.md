# Medicine Box Manager App

## 📋 Tổng Quan

Medicine Box Manager App là feature module cho việc quản lý tủ thuốc, thuốc, lịch uống thuốc và nhắc nhở.

## 🎯 Nguyên Tắc

- **Feature Module**: Chỉ chứa UI và presentation logic
- **Domain Dependency**: Chỉ phụ thuộc domain layer
- **GetIt Usage**: Sử dụng GetIt để resolve use cases
- **Riverpod State**: StateNotifier cho state management
- **Medicine-Specific UI**: UI được customize cho quản lý thuốc

## 📁 Cấu Trúc

```
lib/
├── medicine_box_manager_app.dart
└── presentation/
    ├── screens/
    │   ├── home/
    │   │   ├── medicine_home_screen.dart
    │   │   ├── medicine_home_view_model.dart
    │   │   └── medicine_home_state.dart
    │   ├── medicine_detail/
    │   │   ├── medicine_detail_screen.dart
    │   │   ├── medicine_detail_view_model.dart
    │   │   └── medicine_detail_state.dart
    │   ├── medicine_add/
    │   │   ├── medicine_add_screen.dart
    │   │   ├── medicine_add_view_model.dart
    │   │   └── medicine_add_state.dart
    │   ├── schedule/
    │   │   ├── medicine_schedule_screen.dart
    │   │   ├── medicine_schedule_view_model.dart
    │   │   └── medicine_schedule_state.dart
    │   ├── reminders/
    │   │   ├── medicine_reminders_screen.dart
    │   │   ├── medicine_reminders_view_model.dart
    │   │   └── medicine_reminders_state.dart
    │   └── settings/
    │       ├── medicine_settings_screen.dart
    │       ├── medicine_settings_view_model.dart
    │       └── medicine_settings_state.dart
    ├── widgets/
    │   ├── medicine_card.dart
    │   ├── medicine_stats_widget.dart
    │   ├── medicine_category_filter.dart
    │   ├── medicine_expiry_warning.dart
    │   ├── medicine_schedule_widget.dart
    │   └── medicine_reminder_widget.dart
    └── providers/
        └── medicine_providers.dart
```

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Foundation
  design_system:
    path: ../../foundation/design_system
  navigation:
    path: ../../foundation/navigation
  shared_presentation:
    path: ../../foundation/shared_presentation
  common:
    path: ../../foundation/common
  
  # Core - CHỈ domain!
  domain:
    path: ../../core/domain
  
  # ✅ get_it để resolve dependencies
  get_it: ^7.6.0
  flutter_riverpod: ^2.5.0
  
  # ❌ KHÔNG depend: data, network, local_storage, config
```

## 📝 Sử Dụng

### Main App Widget

```dart
class MedicineBoxManagerApp extends StatelessWidget {
  const MedicineBoxManagerApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Medicine Box Manager',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
```

### ViewModel Pattern

```dart
class MedicineHomeViewModel extends BaseViewModel<MedicineHomeState> {
  late final GetStorageItemsUseCase _getMedicinesUseCase;
  late final GetExpiringItemsUseCase _getExpiringMedicinesUseCase;
  late final GetStorageStatsUseCase _getStatsUseCase;
  late final GetMedicineScheduleUseCase _getScheduleUseCase;
  
  MedicineHomeViewModel() : super(MedicineHomeState.initial()) {
    _getMedicinesUseCase = resolve<GetStorageItemsUseCase>();
    _getExpiringMedicinesUseCase = resolve<GetExpiringItemsUseCase>();
    _getStatsUseCase = resolve<GetStorageStatsUseCase>();
    _getScheduleUseCase = resolve<GetMedicineScheduleUseCase>();
  }
  
  Future<void> loadData() async {
    await handleAsync(
      () async {
        // Load medicines
        final medicinesResult = await _getMedicinesUseCase.execute(
          categoryId: 'medicine', // Filter for medicines only
        );
        medicinesResult.fold(
          (failure) => setError(failure.message),
          (medicines) => state = state.copyWith(medicines: medicines),
        );
        
        // Load expiring medicines
        final expiringResult = await _getExpiringMedicinesUseCase.execute();
        expiringResult.fold(
          (failure) => setError(failure.message),
          (expiringMedicines) => state = state.copyWith(expiringMedicines: expiringMedicines),
        );
        
        // Load stats
        final statsResult = await _getStatsUseCase.execute();
        statsResult.fold(
          (failure) => setError(failure.message),
          (stats) => state = state.copyWith(stats: stats),
        );
        
        // Load today's schedule
        final scheduleResult = await _getScheduleUseCase.execute(
          date: DateTime.now(),
        );
        scheduleResult.fold(
          (failure) => setError(failure.message),
          (schedule) => state = state.copyWith(todaySchedule: schedule),
        );
      },
    );
  }
  
  void filterByCategory(String? categoryId) {
    state = state.copyWith(selectedCategoryId: categoryId);
  }
  
  void searchMedicines(String query) {
    state = state.copyWith(searchQuery: query);
  }
  
  Future<void> markMedicineTaken(String medicineId) async {
    await handleAsync(
      () async {
        final result = await _markMedicineTakenUseCase.execute(medicineId);
        result.fold(
          (failure) => setError(failure.message),
          (_) => loadData(), // Reload to update schedule
        );
      },
    );
  }
}

@freezed
class MedicineHomeState extends BaseState with _$MedicineHomeState {
  const factory MedicineHomeState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isInitialized,
    @Default([]) List<StorageItem> medicines,
    @Default([]) List<StorageItem> expiringMedicines,
    StorageStats? stats,
    List<MedicineSchedule>? todaySchedule,
    String? selectedCategoryId,
    @Default('') String searchQuery,
  }) = _MedicineHomeState;
  
  const MedicineHomeState._();
  
  static MedicineHomeState initial() => const MedicineHomeState();
  
  List<StorageItem> get filteredMedicines {
    var filtered = medicines;
    
    if (selectedCategoryId != null) {
      filtered = filtered.where((medicine) => medicine.category.id == selectedCategoryId).toList();
    }
    
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((medicine) => 
        medicine.name.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }
  
  List<MedicineSchedule> get pendingMedicines {
    return todaySchedule?.where((schedule) => !schedule.isTaken).toList() ?? [];
  }
}
```

### Screen Implementation

```dart
class MedicineHomeScreen extends ConsumerWidget {
  const MedicineHomeScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(medicineHomeViewModelProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tủ Thuốc'),
        backgroundColor: AppColor.medicine,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.pushTo(MedicineRoutes.addMedicine),
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lỗi: $error'),
              ElevatedButton(
                onPressed: () => ref.read(medicineHomeViewModelProvider.notifier).loadData(),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        success: () => _buildContent(context, ref, state),
      ),
    );
  }
  
  Widget _buildContent(BuildContext context, WidgetRef ref, MedicineHomeState state) {
    return Column(
      children: [
        // Stats Widget
        if (state.stats != null)
          MedicineStatsWidget(stats: state.stats!),
        
        // Today's Schedule
        if (state.todaySchedule?.isNotEmpty == true)
          MedicineScheduleWidget(
            schedule: state.todaySchedule!,
            onMedicineTaken: (medicineId) => 
              ref.read(medicineHomeViewModelProvider.notifier).markMedicineTaken(medicineId),
          ),
        
        // Expiry Warning
        if (state.expiringMedicines.isNotEmpty)
          MedicineExpiryWarning(medicines: state.expiringMedicines),
        
        // Category Filter
        MedicineCategoryFilter(
          selectedCategoryId: state.selectedCategoryId,
          onCategorySelected: (categoryId) => 
            ref.read(medicineHomeViewModelProvider.notifier).filterByCategory(categoryId),
        ),
        
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Tìm kiếm thuốc...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) => 
              ref.read(medicineHomeViewModelProvider.notifier).searchMedicines(query),
          ),
        ),
        
        // Medicines List
        Expanded(
          child: MedicineListWidget(
            medicines: state.filteredMedicines,
            onMedicineTap: (medicine) => context.goToMedicineDetail(medicine.id),
            onMedicineDelete: (medicine) => _deleteMedicine(context, ref, medicine),
          ),
        ),
      ],
    );
  }
  
  void _deleteMedicine(BuildContext context, WidgetRef ref, StorageItem medicine) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa thuốc'),
        content: Text('Bạn có chắc muốn xóa "${medicine.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(medicineHomeViewModelProvider.notifier).deleteMedicine(medicine.id);
            },
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}
```

### Medicine-Specific Widgets

```dart
class MedicineCard extends StatelessWidget {
  final StorageItem medicine;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  
  const MedicineCard({
    super.key,
    required this.medicine,
    required this.onTap,
    this.onDelete,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.medicine,
          child: Icon(
            _getMedicineIcon(medicine.category.name),
            color: Colors.white,
          ),
        ),
        title: Text(medicine.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(medicine.category.name),
            Text('HSD: ${medicine.expiryDate.formattedDate}'),
            if (medicine.isExpiringSoon)
              const Text(
                'Sắp hết hạn!',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (medicine.isExpiringSoon)
              const ExpiryBadgeWidget(),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
  
  IconData _getMedicineIcon(String category) {
    switch (category.toLowerCase()) {
      case 'thuốc cảm':
        return Icons.thermostat;
      case 'thuốc đau đầu':
        return Icons.healing;
      case 'vitamin':
        return Icons.eco;
      default:
        return Icons.medication;
    }
  }
}

class MedicineScheduleWidget extends StatelessWidget {
  final List<MedicineSchedule> schedule;
  final Function(String) onMedicineTaken;
  
  const MedicineScheduleWidget({
    super.key,
    required this.schedule,
    required this.onMedicineTaken,
  });
  
  @override
  Widget build(BuildContext context) {
    final pendingMedicines = schedule.where((s) => !s.isTaken).toList();
    
    if (pendingMedicines.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.medicine.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.medicine),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.schedule, color: AppColor.medicine),
              const SizedBox(width: 8),
              Text(
                'Lịch uống thuốc hôm nay',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.medicine,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...pendingMedicines.map((schedule) => 
            MedicineReminderWidget(
              schedule: schedule,
              onTaken: () => onMedicineTaken(schedule.medicineId),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineReminderWidget extends StatelessWidget {
  final MedicineSchedule schedule;
  final VoidCallback onTaken;
  
  const MedicineReminderWidget({
    super.key,
    required this.schedule,
    required this.onTaken,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.medicineName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${schedule.dosage} - ${schedule.time.formatTime}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onTaken,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.medicine,
              foregroundColor: Colors.white,
            ),
            child: const Text('Đã uống'),
          ),
        ],
      ),
    );
  }
}
```

### Providers

```dart
final medicineHomeViewModelProvider = StateNotifierProvider<MedicineHomeViewModel, MedicineHomeState>(
  (ref) => MedicineHomeViewModel(),
);

final medicineDetailViewModelProvider = StateNotifierProvider.family<MedicineDetailViewModel, MedicineDetailState, String>(
  (ref, medicineId) => MedicineDetailViewModel(medicineId),
);

final medicineAddViewModelProvider = StateNotifierProvider<MedicineAddViewModel, MedicineAddState>(
  (ref) => MedicineAddViewModel(),
);

final medicineScheduleViewModelProvider = StateNotifierProvider<MedicineScheduleViewModel, MedicineScheduleState>(
  (ref) => MedicineScheduleViewModel(),
);

final medicineRemindersViewModelProvider = StateNotifierProvider<MedicineRemindersViewModel, MedicineRemindersState>(
  (ref) => MedicineRemindersViewModel(),
);
```

## ✅ Validation

- [ ] Feature module - chỉ UI và presentation
- [ ] Phụ thuộc: domain, foundation, get_it
- [ ] KHÔNG phụ thuộc: data, network, local_storage, config
- [ ] ViewModels dùng GetIt.I<UseCase>()
- [ ] State management với Riverpod
- [ ] Medicine-specific UI components
- [ ] Schedule và reminder functionality

## 🚀 Phase 1 Features

- **Home Dashboard**: Tổng quan tủ thuốc
- **Medicine Management**: Thêm, sửa, xóa thuốc
- **Category Filtering**: Lọc theo loại thuốc
- **Search**: Tìm kiếm thuốc
- **Expiry Tracking**: Theo dõi hạn sử dụng thuốc
- **Schedule Management**: Lịch uống thuốc
- **Reminders**: Nhắc nhở uống thuốc
- **Stats Dashboard**: Thống kê tủ thuốc