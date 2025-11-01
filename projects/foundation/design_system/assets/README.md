# Assets cho Design System

Thư mục này chứa tất cả các assets (hình ảnh, icons, v.v.) cho design system package.

## Cấu trúc

```
assets/
├── images/     # Hình ảnh cho design system
└── icons/      # Icons cho design system
```

## Sử dụng Assets

Sau khi thêm asset vào thư mục tương ứng, chạy lệnh sau để generate code:

```bash
cd projects/foundation/design_system
flutter pub run build_runner build --delete-conflicting-outputs
```

Sau đó có thể sử dụng assets trong code như sau:

```dart
import 'package:design_system/design_system.dart';

// Sử dụng image
Image.asset(Assets.images.logo.path)

// Sử dụng icon
Image.asset(Assets.icons.home.path)
```

## Lưu ý

- Tất cả assets sẽ được generate tự động vào `lib/gen/assets.gen.dart`
- File này được export trong `design_system.dart`, không cần import trực tiếp
- Chạy `build_runner` mỗi khi thêm/sửa/xóa assets

