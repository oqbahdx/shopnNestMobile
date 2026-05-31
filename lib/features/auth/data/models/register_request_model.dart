import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
abstract class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}
