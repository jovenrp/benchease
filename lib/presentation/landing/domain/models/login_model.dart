import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel({
    this.token_type,
    this.expires_in,
    this.access_token,
    this.refresh_token,
    this.error,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @JsonKey(name: 'token_type')
  final String? token_type;

  @JsonKey(name: 'expires_in')
  final int? expires_in;

  @JsonKey(name: 'access_token')
  final String? access_token;

  @JsonKey(name: 'refresh_token')
  final String? refresh_token;

  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'message')
  final String? message;
}
