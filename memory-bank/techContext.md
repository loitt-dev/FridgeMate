# FridgeMate - Technical Context

## Kiến Trúc Tổng Thể

### Clean Architecture với Module Hóa
Dự án sử dụng Clean Architecture với dependency flow rõ ràng:

```
Root App (lib/) → Features → Foundation → Domain ← Data ← Infrastructure
```

### Dependency Flow
- **Root App**: Setup GetIt & register all dependencies
- **Features**: GetIt.I<UseCase>() trong ViewModels, depend: domain, foundation, get_it
- **Foundation**: Depend: domain, get_it
- **Domain**: Pure Dart, NO dependencies
- **Data**: RepositoryImpl với constructor injection
- **Infrastructure**: Pure infrastructure (dio, drift, etc.)

## Stack Công Nghệ

### Core Technologies
- **Flutter SDK**: ^3.9.2
- **Dart SDK**: ^3.9.2
- **Dependency Injection**: GetIt + Injectable
- **State Management**: Flutter Riverpod ^2.5.0

### Data Layer
- **Network**: Dio (HTTP client)
- **Local Storage**: Drift (SQLite) + SharedPreferences
- **Code Generation**: build_runner ^2.4.0

### Development Tools
- **Linting**: flutter_lints ^5.0.0
- **Testing**: flutter_test
- **Code Generation**: injectable_generator ^2.4.0

## Cấu Trúc Module

### Core Modules
```
/projects/core/
├── domain/          # Business logic (pure Dart)
├── data/            # Repository implementations  
├── network/         # Dio setup
├── local_storage/   # Drift/SharedPrefs
└── config/          # Constants, environment
```

### Foundation Modules
```
/projects/foundation/
├── design_system/        # Theme, styles, colors
├── navigation/           # Routes, go_router
├── common/              # Utils, extensions
└── shared_presentation/ # Base ViewModels, widgets
```

### Feature Modules
```
/projects/features/
├── fridge_manager_app/      # Fridge UI
└── medicine_box_manager_app/ # Medicine UI
```

## Patterns & Conventions

### Dependency Injection
- Sử dụng GetIt với Injectable
- Constructor injection cho Use Cases
- Repository pattern với interfaces

### State Management
- Riverpod cho state management
- ViewModels extend base classes từ shared_presentation

### Code Organization
- Feature-based modules
- Clean separation of concerns
- Interface segregation

## Development Workflow

### Setup Commands
```bash
# Install dependencies
flutter pub get
find projects -name "pubspec.yaml" -exec flutter pub get -C {} \;

# Code generation
find projects -name "pubspec.yaml" -exec flutter packages pub run build_runner build -C {} \;
```

### Testing & Quality
```bash
# Run tests
find projects -name "test" -type d -exec flutter test -C {} \;

# Linting
find projects -name "analysis_options.yaml" -exec flutter analyze -C {} \;
```

### Running Apps
```bash
# Fridge Manager
flutter run --flavor fridge

# Medicine Box Manager  
flutter run --flavor medicine
```

## Key Design Decisions

1. **Module Architecture**: Tách biệt rõ ràng giữa core, foundation, features
2. **Dependency Direction**: Domain không phụ thuộc vào bất kỳ layer nào
3. **Offline-First**: Phase 1 tập trung vào offline functionality
4. **Multi-Flavor**: Hỗ trợ nhiều app từ cùng codebase
5. **Code Generation**: Sử dụng build_runner cho DI và data classes
