import 'package:benchease/presentation/dashboard/domain/models/hotskill_model.dart';
import 'package:benchease/presentation/dashboard/domain/models/skill_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/services/persistence_service.dart';
import '../../dashboard/domain/models/user_model.dart';
import '../../dashboard/domain/repositories/dashboard_repository.dart';
import '../../landing/domain/repositories/landing_repository.dart';
import 'employee_detail_state.dart';

class EmployeeDetailBloc extends Cubit<EmployeeDetailState> {
  EmployeeDetailBloc({
    required this.dashboardRepository,
    required this.landingRepository,
    required this.persistenceService,
  }) : super(EmployeeDetailState());

  final DashboardRepository dashboardRepository;
  final LandingRepository landingRepository;
  final PersistenceService persistenceService;

  Future<void> generateCV() async {}

  Future<void> getUserSkills(String? empId) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    String? accessToken = await persistenceService.accessToken.get();
    try {
      final String result = await landingRepository.getUserSkills(
          accessToken: accessToken, empId: empId);

      /* List<String> allSkills = <String>[];
      for (SkillModel item in result.result ?? <SkillModel>[]) {
        if (item.attributes?.approved == true) {
          allSkills.add(item.attributes?.title ?? '');
        }
      }
      print('result: ${result.result?.length}');*/
      emit(state.copyWith(
        isLoading: false,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(isLoading: false)); //turn off loading indicator
    }
  }

  Future<void> getHotSkills(UserModel? user) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    List<String> hotSkills = <String>[];
    List<String> secondarySkills = <String>[];
    List<String> otherSkills = <String>[];
    for (HotSkillModel item in user?.skills ?? <HotSkillModel>[]) {
      if (item.category.toString().toLowerCase() == 'primary') {
        hotSkills.add(item.title ?? '');
      }
      if (item.category.toString().toLowerCase() == 'secondary') {
        secondarySkills.add(item.title ?? '');
      }
      if (item.category.toString().toLowerCase() == 'others') {
        otherSkills.add(item.title ?? '');
      }
    }
    /*List<String> hotSkills = <String>[
      'Java',
      'Javascript',
      'Flutter',
      'NodeJS',
      'PHP',
      'MySql',
      'Oracle',
      'Swift',
      'C++',
      'Unity'
    ];*/
    Future.delayed(const Duration(milliseconds: 1000), () {
      emit(state.copyWith(
          isLoading: false,
          hotSkills: hotSkills,
          otherSkills: otherSkills,
          secondarySkills: secondarySkills));
    });
  }

  Future<void> getOtherSkills() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    List<String> otherSkills = <String>[
      'Scrum Master',
      'C#',
      'Flame Engine',
      'Cocos2d-x',
      'Automation Testing',
      'Unit Testing',
      'Penetration Testing',
      'Project Manager',
      'Product Owner',
      'PHP',
      'HTML',
      'CSS',
      'Javascript',
      'Jquery',
      'Bootstrap',
      'Google Materialize',
    ];
    Future.delayed(const Duration(milliseconds: 1000), () {
      emit(state.copyWith(isLoading: false, otherSkills: otherSkills));
    });
  }
}
