abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class ServerException extends AppException {
  const ServerException({String message = 'Server Exception'}) : super(message);
}

class ValidationException extends AppException {
  final String? errorCode;

  const ValidationException({
    required String message,
    this.errorCode,
  }) : super(message);
}

class NetworkException extends AppException {
  const NetworkException({String message = 'Network Error'}) : super(message);
}

class TimeoutException extends AppException {
  const TimeoutException({String message = 'Request Timeout'}) : super(message);
}

class CacheException extends AppException {
  const CacheException({String message = 'Cache Exception'}) : super(message);
}
