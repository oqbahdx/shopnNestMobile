import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  String _extractMessage(dynamic data) {
    if (data is Map) {
      final message = data['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }
    if (data is String && data.trim().isNotEmpty) {
      return data;
    }
    return 'Server Error';
  }

  String? _extractErrorCode(dynamic data) {
    if (data is Map) {
      final errorCode = data['errorCode'];
      if (errorCode is String && errorCode.trim().isNotEmpty) {
        return errorCode;
      }
    }
    return null;
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    try {
      final response = await dio.post(
        '/api/v1/auth/register',
        data: requestModel.toJson(),
      );

      return RegisterResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const TimeoutException(message: 'Request Timeout');
      }

      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(message: e.message ?? 'Network Error');
      }

      final responseData = e.response?.data;
      if (responseData != null) {
        final message = _extractMessage(responseData);
        final errorCode = _extractErrorCode(responseData);
        if (errorCode == 'AUTH_IDENTITY_ERROR') {
          throw ValidationException(message: message, errorCode: errorCode);
        }
        throw ServerException(message: message);
      }

      throw NetworkException(message: e.message ?? 'Network Error');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
