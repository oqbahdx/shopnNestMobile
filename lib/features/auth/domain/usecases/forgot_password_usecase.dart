import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/register_entity.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class ForgotPasswordUseCase implements UseCase<Either<Failure, RegisterEntity>, ForgotPasswordParams> {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterEntity>> call(ForgotPasswordParams params) {
    return repository.forgotPassword(params);
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;

  const ForgotPasswordParams({required this.email});

  @override
  List<Object?> get props => [email];
}
