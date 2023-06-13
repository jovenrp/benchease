import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/models/user_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    bool? didFinished,
    String? errorMessage,
    List<UserModel>? users,
    List<HotSkillModel>? hotSkills,
    List<String>? allSkills,
  }) = _DashboardState;
}
