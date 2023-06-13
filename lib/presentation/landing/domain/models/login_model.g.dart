// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      token_type: json['token_type'] as String?,
      expires_in: json['expires_in'] as int?,
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'error': instance.error,
      'message': instance.message,
    };
