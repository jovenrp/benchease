import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotskill_response.g.dart';

@JsonSerializable()
class HotSkillResponse {
  HotSkillResponse({
    this.result,
    this.message,
    this.status,
  });

  factory HotSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$HotSkillResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HotSkillResponseToJson(this);

  @JsonKey(name: 'result')
  final List<HotSkillModel>? result;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;
}
