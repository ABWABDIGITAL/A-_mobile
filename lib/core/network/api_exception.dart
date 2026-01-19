// lib/core/network/api_exception.dart
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.errorCode,
    this.data,
  });

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, errorCode: $errorCode, message: $message)';
}