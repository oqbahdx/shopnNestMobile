import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/register_entity.dart';
import '../usecases/register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params);
}
