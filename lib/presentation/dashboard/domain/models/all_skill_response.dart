import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:benchease/presentation/dashboard/domain/models/skill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_skill_response.g.dart';

@JsonSerializable()
class AllSkillResponse {
  AllSkillResponse({
    this.result,
    this.message,
  });

  factory AllSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$AllSkillResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AllSkillResponseToJson(this);

  @JsonKey(name: 'result')
  final List<SkillModel>? result;

  @JsonKey(name: 'message')
  final String? message;
}
