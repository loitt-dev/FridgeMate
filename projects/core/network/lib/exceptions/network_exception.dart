import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorCode;

  const NetworkException({
    required this.message,
    this.statusCode,
    this.errorCode,
  });

  factory NetworkException.fromDioException(dynamic error) {
    if (error is DioException) {
      return NetworkException(
        message: error.message ?? 'Network error occurred',
        statusCode: error.response?.statusCode,
        errorCode: error.response?.data?['error_code'],
      );
    }
    return NetworkException(message: error.toString());
  }

  @override
  String toString() => 'NetworkException: $message';
}
