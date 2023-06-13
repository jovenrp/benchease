// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotskill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSkillResponse _$HotSkillResponseFromJson(Map<String, dynamic> json) =>
    HotSkillResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => HotSkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HotSkillResponseToJson(HotSkillResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'status': instance.status,
    };
