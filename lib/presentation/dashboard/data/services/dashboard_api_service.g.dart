// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DashboardApiService implements DashboardApiService {
  _DashboardApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://166.70.31.151:5000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HotSkillResponse> getHotSkills() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HotSkillResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/benchease/v1/hotskills',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HotSkillResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchResponse> searchSkill(skillTitles) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SearchResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/benchease/v1/search/employees?skillTitles=$skillTitles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> generateCV() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/v1/report/resume/b90e6e6f-592e-477b-973d-61e05066fc18',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
