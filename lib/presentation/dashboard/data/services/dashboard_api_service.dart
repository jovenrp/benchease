import 'package:benchease/presentation/dashboard/domain/models/search_response.dart';
import 'package:benchease/presentation/landing/domain/models/login_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../domain/models/hotskill_response.dart';

part 'dashboard_api_service.g.dart';

@RestApi(baseUrl: 'http://166.70.31.151:5000')
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio, {String baseUrl}) = _DashboardApiService;

  @GET('/benchease/v1/hotskills')
  Future<HotSkillResponse> getHotSkills();

  @GET('/benchease/v1/search/employees?skillTitles={skillTitles}')
  Future<SearchResponse> searchSkill(@Path('skillTitles') String skillTitles);

  @GET('/api/v1/report/resume/b90e6e6f-592e-477b-973d-61e05066fc18')
  Future<void> generateCV();

/*@POST('/userBasicLogin.html?useHdrs=true&uid={uid}&pwd={pwd}')
  Future<String> authenticateUser(
      @Path('uid') String uid, @Path('pwd') String pwd);*/
}
