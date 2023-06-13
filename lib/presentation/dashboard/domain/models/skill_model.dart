import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel {
  SkillModel({
    this.id,
    this.type,
    this.attributes,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillModelToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'attributes')
  final AttributesModel? attributes;
}

@JsonSerializable()
class AttributesModel {
  AttributesModel({
    this.title,
    this.approved,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      _$AttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesModelToJson(this);

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'approved')
  final bool? approved;
}
