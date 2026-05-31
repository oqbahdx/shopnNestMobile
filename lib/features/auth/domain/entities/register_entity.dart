import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool success;
  final String message;
  final String data;

  const RegisterEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];
}
