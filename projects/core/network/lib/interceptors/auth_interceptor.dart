import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add auth token to requests
    // Implementation would get token from secure storage
    const token = 'your_auth_token_here';
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle auth errors (401, 403)
    if (err.response?.statusCode == 401) {
      // Redirect to login or refresh token
    }
    handler.next(err);
  }
}
