// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotskill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSkillModel _$HotSkillModelFromJson(Map<String, dynamic> json) =>
    HotSkillModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      searchCount: json['searchCount'] as int?,
      approved: json['approved'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$HotSkillModelToJson(HotSkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'searchCount': instance.searchCount,
      'approved': instance.approved,
      'category': instance.category,
    };
