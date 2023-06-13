// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesModel.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesModel _$AttributesModelFromJson(Map<String, dynamic> json) =>
    AttributesModel(
      title: json['title'] as String?,
      approved: json['approved'] as bool?,
    );

Map<String, dynamic> _$AttributesModelToJson(AttributesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'approved': instance.approved,
    };
