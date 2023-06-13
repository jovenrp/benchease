import '../../../../application/application.dart';
import '../../../dashboard/domain/models/all_skill_response.dart';
import '../../data/services/login_api_services.dart';
import '../models/login_model.dart';
import 'landing_repository.dart';

class LandingRepositoryimpl implements LandingRepository {
  LandingRepositoryimpl(this._apiService);

  final LoginApiService _apiService;

  @override
  Future<LoginModel> login(String? username, String? password) async {
    try {
      LoginModel token = await _apiService.authenticateUser(
        'password',
        '994da195-3c54-47f5-8022-57da72d56148',
        '0bzG2xAsOtQypRSNAxgN8Lqc53U0DS2TBencfyiT',
        username ?? '',
        password ?? '',
        '',
      );

      return token;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return LoginModel(
          error: 'invalid_grant',
          message: 'The user credentials were incorrect.');
    }
  }

  @override
  Future<String> addSkill({String? title, String? accessToken}) async {
    try {
      String token = await _apiService.addSkill(
          'application/json', 'Bearer $accessToken', title ?? '');

      return token;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return 'error';
    }
  }

  @override
  Future<AllSkillResponse> getAllSkill({String? accessToken}) async {
    try {
      print('accessToken $accessToken');
      AllSkillResponse token = await _apiService.getAllSkills(
          'application/json', 'Bearer $accessToken');

      return token;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return AllSkillResponse(message: 'failed');
    }
  }

  @override
  Future<String> getUserSkills({String? empId, String? accessToken}) async {
    try {
      String token = await _apiService.getUserSkills(
          'application/json', 'Bearer $accessToken', empId ?? '');

      return token;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return '';
    }
  }
}
