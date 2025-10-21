# Network Module

## 📋 Tổng Quan

Network module cung cấp HTTP client setup với Dio, interceptors, và error handling cho FridgeMate.

## 🎯 Nguyên Tắc

- **Pure Infrastructure**: Không chứa business logic
- **HTTP Client**: Sử dụng Dio cho HTTP requests
- **Interceptors**: Auth, logging, error handling
- **No Dependencies**: Không phụ thuộc domain/data modules
- **Reusable**: Có thể sử dụng bởi bất kỳ module nào

## 📁 Cấu Trúc

```
lib/
├── network.dart
├── dio_client.dart                 # Dio client setup
├── api_endpoints.dart              # API endpoints constants
├── interceptors/
│   ├── auth_interceptor.dart       # Authentication
│   ├── logging_interceptor.dart    # Request/Response logging
│   └── interceptors.dart
└── exceptions/
    └── network_exception.dart      # Network-specific exceptions
```

## 🔧 Dependencies

```yaml
dependencies:
  dio: ^5.4.0
  pretty_dio_logger: ^1.3.1
  
  # ❌ NO domain/data dependencies
  # ❌ NO get_it
```

## 📝 Sử Dụng

### DioClient Setup

```dart
class DioClient {
  late final Dio _dio;
  
  DioClient({required String baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }
  
  Dio get dio => _dio;
}
```

### API Endpoints

```dart
class ApiEndpoints {
  // Storage
  static const String storageItems = '/api/v1/storage/items';
  static const String storageCategories = '/api/v1/storage/categories';
  
  // Recipes
  static const String recipes = '/api/v1/recipes';
  static const String suggestedRecipes = '/api/v1/recipes/suggested';
  
  // Shopping
  static const String shoppingLists = '/api/v1/shopping/lists';
}
```

### Interceptors

```dart
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add auth token if available
    final token = _getAuthToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
    }
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    handler.next(response);
  }
}
```

### Network Exceptions

```dart
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  
  const NetworkException(this.message, [this.statusCode]);
  
  @override
  String toString() => 'NetworkException: $message';
}

class TimeoutException extends NetworkException {
  const TimeoutException(super.message);
}

class ServerException extends NetworkException {
  const ServerException(super.message, super.statusCode);
}
```

## ✅ Validation

- [ ] Pure infrastructure - no business logic
- [ ] KHÔNG phụ thuộc domain/data
- [ ] KHÔNG có get_it
- [ ] Dio client được setup đúng
- [ ] Interceptors hoạt động
- [ ] Error handling đầy đủ
- [ ] API endpoints được define

## 🚀 Phase 1 Features

- **HTTP Client**: Dio setup với timeout
- **Request Logging**: Debug logging cho development
- **Error Handling**: Network exceptions
- **API Endpoints**: Constants cho tất cả endpoints
- **Interceptors**: Auth và logging (sẵn sàng cho Phase 2)
