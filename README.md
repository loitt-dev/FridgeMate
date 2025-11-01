# FridgeMate - Smart Fridge & Medicine Management

## 📋 Tổng Quan

FridgeMate là hệ thống quản lý tủ lạnh/tủ thuốc thông minh với kiến trúc Clean Architecture và module hóa. Dự án được phát triển theo 5 phases, hiện tại đang tập trung vào **Phase 1**.

## 🎯 Phase 1 - Offline Management

**Phase 1** cung cấp các tính năng cơ bản:

- **Quản lý tủ lạnh**: Thêm, sửa, xóa thực phẩm
- **Quản lý tủ thuốc**: Thêm, sửa, xóa thuốc
- **Gợi ý thực đơn**: Công thức nấu ăn dựa trên nguyên liệu có sẵn
- **Danh sách mua sắm**: Tạo và quản lý danh sách mua sắm
- **Theo dõi hạn sử dụng**: Cảnh báo thực phẩm/thuốc sắp hết hạn
- **Thống kê**: Dashboard với thông tin tổng quan

## 🏗️ Kiến Trúc

### Dependency Flow

```
┌────────────────────────────────────────┐
│  Root App (/lib/)                      │
│  - Setup GetIt & register all deps    │
└──────────┬─────────────────────────────┘
           │ imports all
           ↓
┌────────────────────────────────────────┐
│  Features (fridge_app, medicine_app)   │
│  GetIt.I<UseCase>() trong ViewModels   │
│  Depend: domain, foundation, get_it    │
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Foundation (design, navigation...)    │
│  Depend: domain, get_it                │
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Domain (Pure Dart)                    │
│  - Entities, Repository Interfaces     │
│  - Use Cases (constructor injection)   │
│  Dependencies: NONE!                   │
└────────────────────────────────────────┘
           ↑ implements
           │
┌────────────────────────────────────────┐
│  Data                                  │
│  - RepositoryImpl (constructor inj)    │
│  Depend: domain, network, local_storage│
└──────────┬─────────────────────────────┘
           │ uses
           ↓
┌────────────────────────────────────────┐
│  Infrastructure (network, local_storage)│
│  Pure infrastructure - no business logic│
│  Dependencies: dio, drift, etc.        │
└────────────────────────────────────────┘
```

### Module Structure

```
/projects/
├── core/
│   ├── domain/                   # Business logic (pure Dart)
│   ├── data/                     # Data implementations
│   ├── network/                  # Dio setup
│   ├── local_storage/            # Drift/SharedPrefs
│   └── config/                   # Constants, environment
│
├── foundation/
│   ├── design_system/            # Theme, styles, colors
│   ├── navigation/               # Routes, go_router
│   ├── common/                   # Utils, extensions
│   └── shared_presentation/      # Base ViewModels, widgets
│
└── features/
    ├── fridge_manager_app/       # Fridge UI
    └── medicine_box_manager_app/ # Medicine UI
```

## 🚀 Cài Đặt & Chạy

### Yêu Cầu

- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2

### Cài Đặt Dependencies

```bash
# Cài đặt dependencies cho root project
flutter pub get

# Cài đặt dependencies cho tất cả modules
find projects -name "pubspec.yaml" -exec flutter pub get -C {} \;
```

### Chạy Ứng Dụng

```bash
# Chạy Fridge Manager App
flutter run --flavor fridge

# Chạy Medicine Box Manager App  
flutter run --flavor medicine
```

## 📦 Modules

### Core Modules

- **[Domain](./projects/core/domain/README.md)**: Business logic thuần túy
- **[Data](./projects/core/data/README.md)**: Repository implementations
- **[Network](./projects/core/network/README.md)**: HTTP client setup
- **[Local Storage](./projects/core/local_storage/README.md)**: Database & preferences
- **[Config](./projects/core/config/README.md)**: Configuration & constants

### Foundation Modules

- **[Design System](./projects/foundation/design_system/README.md)**: UI components & theme
- **[Navigation](./projects/foundation/navigation/README.md)**: Routing system
- **[Common](./projects/foundation/common/README.md)**: Utilities & extensions
- **[Shared Presentation](./projects/foundation/shared_presentation/README.md)**: Base classes & widgets

### Feature Modules

- **[Fridge Manager App](./projects/features/fridge_manager_app/README.md)**: Fridge management UI
- **[Medicine Box Manager App](./projects/features/medicine_box_manager_app/README.md)**: Medicine management UI

## 🔧 Development

### Code Generation

```bash
# Generate code cho tất cả modules
find projects -name "pubspec.yaml" -exec dart packages pub run build_runner build -C {} \;
```

### Testing

```bash
# Run tests cho tất cả modules
find projects -name "test" -type d -exec flutter test -C {} \;
```

### Linting

```bash
# Check linting cho tất cả modules
find projects -name "analysis_options.yaml" -exec flutter analyze -C {} \;
```

## 📋 Roadmap

### Phase 1 (Current) - Offline Management
- [x] Core architecture setup
- [x] Domain layer implementation
- [x] Data layer implementation
- [x] Foundation modules
- [x] Feature modules structure
- [ ] UI implementation
- [ ] Testing
- [ ] Documentation

### Phase 2 - Online Features
- [ ] User accounts & authentication
- [ ] Data synchronization
- [ ] Recipe sharing
- [ ] Cloud backup

### Phase 3 - AI Features
- [ ] Image recognition
- [ ] Barcode scanning
- [ ] Price comparison
- [ ] Nutrition analysis

### Phase 4 - Community
- [ ] Social features
- [ ] Recipe ratings
- [ ] Challenges
- [ ] Achievements

### Phase 5 - E-commerce
- [ ] Order management
- [ ] Payment integration
- [ ] Delivery tracking
- [ ] Analytics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, email support@fridgemate.com or join our Discord community.