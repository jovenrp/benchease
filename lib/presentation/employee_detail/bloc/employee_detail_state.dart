import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dashboard/domain/models/user_model.dart';
part 'employee_detail_state.freezed.dart';

@freezed
class EmployeeDetailState with _$EmployeeDetailState {
  factory EmployeeDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    String? errorMessage,
    List<UserModel>? users,
    List<String>? hotSkills,
    List<String>? otherSkills,
    List<String>? secondarySkills,
  }) = _DashboardState;
}
