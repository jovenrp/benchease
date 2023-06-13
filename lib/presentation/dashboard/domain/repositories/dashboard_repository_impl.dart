import 'package:benchease/presentation/dashboard/data/services/dashboard_api_service.dart';
import 'package:benchease/presentation/dashboard/domain/models/hotskill_response.dart';
import 'package:benchease/presentation/landing/domain/models/login_model.dart';

import '../../../../application/application.dart';
import '../models/search_response.dart';
import 'dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._apiService);

  final DashboardApiService _apiService;

  @override
  Future<HotSkillResponse> getHotSkills() async {
    try {
      HotSkillResponse response = await _apiService.getHotSkills();

      return response;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return HotSkillResponse(message: 'failed');
    }
  }

  @override
  Future<SearchResponse> searchSkill(String? skill) async {
    try {
      SearchResponse response = await _apiService.searchSkill(skill ?? '');

      return response;
    } catch (_) {
      logger.e(_);
      //Todo Create a proper way to handle login error
      return SearchResponse(message: 'failed');
    }
  }
}
