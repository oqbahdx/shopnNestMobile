import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../usecases/forgot_password_usecase.dart';
import '../usecases/login_usecase.dart';
import '../usecases/register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params);

  Future<Either<Failure, LoginEntity>> login(LoginParams params);

  Future<Either<Failure, RegisterEntity>> forgotPassword(ForgotPasswordParams params);
}
