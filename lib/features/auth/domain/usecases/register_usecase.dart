import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/register_entity.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RegisterUseCase implements UseCase<Either<Failure, RegisterEntity>, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) {
    return repository.register(params);
  }
}

class RegisterParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, password, confirmPassword];
}
