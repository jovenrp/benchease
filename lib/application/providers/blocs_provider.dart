import 'package:benchease/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:benchease/presentation/dashboard/data/services/dashboard_api_service.dart';
import 'package:benchease/presentation/dashboard/domain/repositories/dashboard_repository_impl.dart';
import 'package:benchease/presentation/employee_detail/bloc/employee_detail_bloc.dart';
import 'package:benchease/presentation/landing/bloc/landing_screen_bloc.dart';
import 'package:benchease/presentation/landing/data/services/login_api_services.dart';
import 'package:benchease/presentation/landing/domain/repositories/landing_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/data/services/persistence_service.dart';
import '../../presentation/splash/bloc/splashscreen_bloc.dart';
import '../domain/bloc/application_bloc.dart';

class BlocsProvider {
  static List<SingleChildWidget> provide({
    required Dio dio,
    required PersistenceService persistenceService,
    required String apiUrl,
    required String kierUrl,
    required String sheenaUrl,
    required ApplicationBloc appBloc,
    required GlobalKey<NavigatorState> navigatorKey,
  }) =>
      <SingleChildWidget>[
        BlocProvider<ApplicationBloc>(
          create: (_) => ApplicationBloc(),
        ),
        BlocProvider<SplashScreenBloc>(
          create: (_) =>
              SplashScreenBloc(persistenceService: persistenceService),
        ),
        BlocProvider<LandingScreenBloc>(
          create: (_) => LandingScreenBloc(
            loginRepository: LandingRepositoryimpl(
              LoginApiService(dio, baseUrl: apiUrl),
            ),
            persistenceService: persistenceService,
          ),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(
            dashboardRepository: DashboardRepositoryImpl(
                DashboardApiService(dio, baseUrl: sheenaUrl)),
            landingRepository: LandingRepositoryimpl(
              LoginApiService(dio, baseUrl: apiUrl),
            ),
            persistenceService: persistenceService,
          ),
        ),
        BlocProvider<EmployeeDetailBloc>(
          create: (_) => EmployeeDetailBloc(
            dashboardRepository: DashboardRepositoryImpl(
                DashboardApiService(dio, baseUrl: kierUrl)),
            landingRepository: LandingRepositoryimpl(
              LoginApiService(dio, baseUrl: apiUrl),
            ),
            persistenceService: persistenceService,
          ),
        ),
      ];
}
