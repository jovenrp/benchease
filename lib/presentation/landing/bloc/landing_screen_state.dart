import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:benchease/core/domain/models/errors/actiontrak_api_error.dart';
import 'package:benchease/core/domain/models/user_profile_model.dart';

part 'landing_screen_state.freezed.dart';

@freezed
class LandingScreenState with _$LandingScreenState {
  factory LandingScreenState(
      {@Default(false) bool isLoading,
      @Default(false) bool hasError,
      ActionTRAKApiErrorCode? errorCode,
      String? errorMessage,
      String? apiUrl,
      String? appVersion,
      String? url,
      String? databaseStatus,
      @Default(false) bool isLoggedIn,
      @Default(false) bool didFinish,
      UserProfileModel? userProfileModel}) = _LandingScreenState;
}
