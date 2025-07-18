# TestFlutter - Cấu trúc dự án Flutter

## Cấu trúc thư mục

```
lib/
├── main.dart                   # Entry point của ứng dụng
├── config/                     # Cấu hình ứng dụng
│   └── app_config.dart        # Cấu hình chung của app
├── models/                     # Data models
│   └── user.dart              # Model User
├── views/                      # UI Layer
│   ├── screens/               # Các màn hình
│   │   └── home_screen.dart   # Màn hình chính
│   └── widgets/               # Widgets tái sử dụng
│       └── custom_button.dart # Button tùy chỉnh
├── controllers/               # Logic controllers
│   └── home_controller.dart   # Controller cho màn hình chính
├── services/                  # Data services
│   ├── interfaces/            # Abstract interfaces
│   │   └── api_service.dart   # Interface cho API service
│   └── http_service.dart      # HTTP service implementation
├── repositories/              # Data repositories
│   └── user_repository.dart   # Repository cho User
├── utils/                     # Tiện ích
│   ├── validator.dart         # Validation utilities
│   ├── date_helper.dart       # Date utilities
│   └── utils.dart             # Export file
├── data/                      # Local data
│   └── local_data_provider.dart # Provider cho dữ liệu local
├── routes/                    # Định tuyến
│   └── app_routes.dart        # Routes của ứng dụng
└── constants/                 # Hằng số
    ├── app_constants.dart     # Hằng số chung
    ├── colors.dart            # Màu sắc
    └── constants.dart         # Export file

assets/
├── images/                    # Hình ảnh
│   └── README.md             # Hướng dẫn sử dụng images
├── icons/                    # Icons
├── fonts/                    # Fonts
└── data/                     # Local JSON files
    └── mock_data.json        # Dữ liệu mẫu
```

## Mô tả các thư mục

### 📁 `lib/config/`
Chứa các file cấu hình của ứng dụng như:
- API endpoints
- Database settings
- Theme configuration
- Environment variables

### 📁 `lib/models/`
Chứa các data models của ứng dụng:
- User model
- Product model
- Category model
- Các model khác...

### 📁 `lib/views/`
Chứa tất cả các thành phần UI:
- **screens/**: Các màn hình chính của ứng dụng
- **widgets/**: Các widget tái sử dụng

### 📁 `lib/controllers/`
Chứa business logic và state management:
- Controllers cho từng màn hình
- Global state management
- Event handling

### 📁 `lib/services/`
Chứa các service xử lý data:
- **interfaces/**: Abstract interfaces
- API services
- Local storage services
- Authentication services

### 📁 `lib/repositories/`
Chứa data repositories:
- Kết nối giữa services và controllers
- Data caching
- Error handling

### 📁 `lib/utils/`
Chứa các utility functions:
- Validation
- Date formatting
- String helpers
- Math utilities

### 📁 `lib/data/`
Chứa local data providers:
- Local JSON data
- Static data
- Mock data

### 📁 `lib/routes/`
Chứa navigation và routing:
- Route definitions
- Navigation logic
- Deep linking

### 📁 `lib/constants/`
Chứa các hằng số:
- Colors
- Strings
- Dimensions
- API endpoints

### 📁 `assets/`
Chứa tất cả các assets:
- **images/**: Hình ảnh, logos, illustrations
- **icons/**: Icons, vector graphics
- **fonts/**: Custom fonts
- **data/**: Local JSON files

## Quy tắc sử dụng

### 1. Import/Export
- Sử dụng export files để tổ chức imports
- Ví dụ: `import '../constants/constants.dart';`

### 2. Naming Convention
- Files: `snake_case.dart`
- Classes: `PascalCase`
- Variables/Methods: `camelCase`
- Constants: `UPPER_SNAKE_CASE`

### 3. Architecture Pattern
- Sử dụng Repository Pattern cho data layer
- Provider/Controller pattern cho state management
- Separation of concerns

### 4. Code Organization
- Mỗi feature nên có folder riêng trong screens/
- Widgets tái sử dụng đặt trong widgets/
- Business logic tách biệt khỏi UI

## Dependencies đã thêm

```yaml
dependencies:
  http: ^1.1.0                 # HTTP client
  intl: ^0.19.0               # Date formatting
  provider: ^6.1.1            # State management
  shared_preferences: ^2.2.2   # Local storage
  json_annotation: ^4.8.1     # JSON serialization

dev_dependencies:
  json_serializable: ^6.7.1   # JSON code generator
  build_runner: ^2.4.7        # Build tools
```

## Cách sử dụng

1. **Cài đặt dependencies:**
   ```bash
   flutter pub get
   ```

2. **Chạy code generation (nếu cần):**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Chạy ứng dụng:**
   ```bash
   flutter run
   ```

## Lưu ý

- Luôn update `pubspec.yaml` khi thêm assets mới
- Sử dụng const constructors khi có thể
- Implement error handling cho tất cả async operations
- Viết unit tests cho business logic
- Sử dụng meaningful names cho files và classes

---

*Cấu trúc này được thiết kế để dễ dàng scale và maintain cho các dự án Flutter lớn.*
