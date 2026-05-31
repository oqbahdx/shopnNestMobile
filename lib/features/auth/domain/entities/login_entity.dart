import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String message;
  final String accessToken;
  final String accessTokenExpiry;
  final String tokenType;

  const LoginEntity({
    required this.message,
    required this.accessToken,
    required this.accessTokenExpiry,
    required this.tokenType,
  });

  @override
  List<Object?> get props => [message, accessToken, accessTokenExpiry, tokenType];
}
