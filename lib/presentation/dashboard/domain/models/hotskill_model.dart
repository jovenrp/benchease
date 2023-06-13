import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotskill_model.g.dart';

@JsonSerializable()
class HotSkillModel {
  HotSkillModel({
    this.id,
    this.title,
    this.searchCount,
    this.approved,
    this.category,
  });

  factory HotSkillModel.fromJson(Map<String, dynamic> json) =>
      _$HotSkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$HotSkillModelToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'searchCount')
  final int? searchCount;

  @JsonKey(name: 'approved')
  final bool? approved;

  @JsonKey(name: 'category')
  final String? category;
}
