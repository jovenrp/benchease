import '../../../dashboard/domain/models/all_skill_response.dart';
import '../models/login_model.dart';

abstract class LandingRepository {
  Future<LoginModel> login(String? username, String? password);
  Future<String> addSkill({String? title, String? accessToken});
  Future<AllSkillResponse> getAllSkill({String? accessToken});
  Future<String> getUserSkills({String? empId, String? accessToken});
}
