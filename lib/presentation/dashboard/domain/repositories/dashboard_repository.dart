import '../models/hotskill_response.dart';
import '../models/search_response.dart';

abstract class DashboardRepository {
  Future<HotSkillResponse> getHotSkills();
  Future<SearchResponse> searchSkill(String? skill);
}
