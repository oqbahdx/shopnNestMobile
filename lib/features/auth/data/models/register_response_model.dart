import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

@freezed
 abstract class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    required bool success,
    required String message,
    String? data,
    @JsonKey(name: 'errorCode') String? errorCode,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
