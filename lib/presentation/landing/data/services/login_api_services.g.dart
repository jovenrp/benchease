// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginApiService implements LoginApiService {
  _LoginApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://166.70.31.151:5000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginModel> authenticateUser(
    grant_type,
    client_id,
    client_secret,
    username,
    password,
    scope,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'grant_type': grant_type,
      'client_id': client_id,
      'client_secret': client_secret,
      'username': username,
      'password': password,
      'scope': scope,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/oauth/token/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> addSkill(
    accept,
    accessToken,
    title,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Authorization': accessToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {'title': title};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/v1/skills/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<AllSkillResponse> getAllSkills(
    accept,
    accessToken,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Authorization': accessToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AllSkillResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/skills/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllSkillResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> getUserSkills(
    accept,
    accessToken,
    user_id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Authorization': accessToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/v1/users/$user_id/tagSkills',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
