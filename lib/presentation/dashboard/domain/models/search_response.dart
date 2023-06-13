import 'package:benchease/presentation/dashboard/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  SearchResponse({
    this.result,
    this.message,
    this.status,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);

  @JsonKey(name: 'result')
  final List<UserModel>? result;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;
}
