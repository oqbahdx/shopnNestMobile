import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/register_usecase.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/register_request_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

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
}

