import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    this.id,
    this.empId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.type,
    this.status,
    this.skills,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'empId')
  final String? empId;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'middleName')
  final String? middleName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'skills')
  final List<HotSkillModel>? skills;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  /*Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'clientId': clientId.toString(),
    'storageId': storageId.toString(),
    'action': action.toString(),
    'status': status.toString(),
    'timestamp': timestamp.toString(),
    'notes': notes.toString(),
    'quantity': quantity.toString(),
  };

  InOutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    storageId = json['storageId'];
    action = json['action'];
    status = json['status'];
    timestamp = json['timestamp'];
    notes = json['notes'];
    quantity = json['quantity'];
  }*/

}
