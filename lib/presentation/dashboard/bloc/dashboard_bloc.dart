import 'package:benchease/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:benchease/presentation/dashboard/domain/models/hotskill_response.dart';
import 'package:benchease/presentation/dashboard/domain/models/search_response.dart';
import 'package:benchease/presentation/dashboard/domain/models/skill_model.dart';
import 'package:benchease/presentation/dashboard/domain/models/user_model.dart';
import 'package:benchease/presentation/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:benchease/presentation/landing/domain/repositories/landing_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/services/persistence_service.dart';
import '../domain/models/all_skill_response.dart';

class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc({
    required this.dashboardRepository,
    required this.landingRepository,
    required this.persistenceService,
  }) : super(DashboardState());

  final DashboardRepository dashboardRepository;
  final LandingRepository landingRepository;
  final PersistenceService persistenceService;

  Future<void> addSkill(String? title) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    String? accessToken = await persistenceService.accessToken.get();
    try {
      final String result = await landingRepository.addSkill(
          title: title, accessToken: accessToken);

      print('result: $result');
      emit(state.copyWith(
        isLoading: false,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(isLoading: false)); //turn off loading indicator
    }
  }

  Future<void> getHotSkills() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final HotSkillResponse result = await dashboardRepository.getHotSkills();

      print('result: $result');
      emit(state.copyWith(isLoading: false, hotSkills: result.result));
    } on DioError catch (_) {
      emit(state.copyWith(isLoading: false)); //turn off loading indicator
    }
  }

  String getUserSkill(List<HotSkillModel>? skills) {
    String userSkills = '';
    for (HotSkillModel item in skills ?? <HotSkillModel>[]) {
      userSkills += '${item.title}, ';
    }
    return userSkills;
  }

  Future<void> getAllSkills() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    String? accessToken = await persistenceService.accessToken.get();
    try {
      print('eherehre');
      final AllSkillResponse result =
          await landingRepository.getAllSkill(accessToken: accessToken);

      List<String> allSkills = <String>[];
      for (SkillModel item in result.result ?? <SkillModel>[]) {
        if (item.attributes?.approved == true) {
          allSkills.add(item.attributes?.title ?? '');
        }
      }
      print('result here: ${result.result?.length}');
      emit(state.copyWith(
        isLoading: false,
        allSkills: allSkills,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(isLoading: false)); //turn off loading indicator
    }
  }

  Future<void> searchSkill(String? value) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final SearchResponse result =
          await dashboardRepository.searchSkill(value);

      print('result: $result');
      emit(state.copyWith(
        isLoading: false,
        users: result.result,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(isLoading: false)); //turn off loading indicator
    }
  }

  Future<void> clearDemo(bool isFinished) async {
    await persistenceService.isDemoFinished.set(isFinished);
    emit(state.copyWith(didFinished: isFinished));
  }

  Future<void> getDemoStatus() async {
    bool? didFinished = await persistenceService.isDemoFinished.get();
    emit(state.copyWith(didFinished: didFinished ?? false));
  }
}
