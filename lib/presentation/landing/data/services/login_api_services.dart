import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../dashboard/domain/models/all_skill_response.dart';
import '../../domain/models/login_model.dart';

part 'login_api_services.g.dart';

@RestApi(baseUrl: 'http://166.70.31.151:5000')
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST('/oauth/token/')
  Future<LoginModel> authenticateUser(
    @Field() String grant_type,
    @Field() String client_id,
    @Field() String client_secret,
    @Field() String username,
    @Field() String password,
    @Field() String scope,
  );

  @POST('/api/v1/skills/')
  Future<String> addSkill(
    @Header('Accept') String? accept,
    @Header('Authorization') String? accessToken,
    @Field() String title,
  );

  @GET('/api/v1/skills/')
  Future<AllSkillResponse> getAllSkills(
    @Header('Accept') String? accept,
    @Header('Authorization') String? accessToken,
  );

  @POST('/api/v1/users/{user_id}/tagSkills')
  Future<String> getUserSkills(
    @Header('Accept') String? accept,
    @Header('Authorization') String? accessToken,
    @Path('user_id') String user_id,
  );

/*@POST('/userBasicLogin.html?useHdrs=true&uid={uid}&pwd={pwd}')
  Future<String> authenticateUser(
      @Path('uid') String uid, @Path('pwd') String pwd);*/
}
