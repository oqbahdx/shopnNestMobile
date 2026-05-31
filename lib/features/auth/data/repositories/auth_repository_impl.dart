import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/storage/secure_storage_service.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/forgot_password_request_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorageService,
  });

  @override
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params) async {
    try {
      final requestModel = RegisterRequestModel(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        confirmPassword: params.confirmPassword,
      );

      final responseModel = await remoteDataSource.register(requestModel);
      final data = responseModel.data;

      if (data == null || data.trim().isEmpty) {
        return const Left(ServerFailure('Invalid server response'));
      }

      return Right(RegisterEntity(
        success: responseModel.success,
        message: responseModel.message,
        data: data,
      ));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams params) async {
    try {
      final requestModel = LoginRequestModel(
        email: params.email,
        password: params.password,
      );

      final responseModel = await remoteDataSource.login(requestModel);

      if (!responseModel.success) {
        return Left(ServerFailure(responseModel.message));
      }

      final data = responseModel.data;
      if (data == null) {
        return const Left(ServerFailure('Invalid server response'));
      }

      await secureStorageService.saveToken(data.accessToken);

      return Right(LoginEntity(
        message: responseModel.message,
        accessToken: data.accessToken,
        accessTokenExpiry: data.accessTokenExpiry,
        tokenType: data.tokenType,
      ));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterEntity>> forgotPassword(ForgotPasswordParams params) async {
    try {
      final requestModel = ForgotPasswordRequestModel(email: params.email);

      final responseModel = await remoteDataSource.forgotPassword(requestModel);

      if (!responseModel.success) {
        return Left(ServerFailure(responseModel.message));
      }

      return Right(RegisterEntity(
        success: responseModel.success,
        message: responseModel.message,
        data: '',
      ));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<bool> hasToken() async {
    return secureStorageService.hasToken();
  }

  @override
  Future<void> deleteToken() async {
    await secureStorageService.deleteToken();
  }
}

