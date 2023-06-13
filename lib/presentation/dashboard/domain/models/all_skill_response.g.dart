// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_skill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSkillResponse _$AllSkillResponseFromJson(Map<String, dynamic> json) =>
    AllSkillResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AllSkillResponseToJson(AllSkillResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
