// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      empId: json['empId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      status: json['status'] as int?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => HotSkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'empId': instance.empId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'email': instance.email,
      'type': instance.type,
      'status': instance.status,
      'skills': instance.skills,
      'created_at': instance.createdAt,
    };
