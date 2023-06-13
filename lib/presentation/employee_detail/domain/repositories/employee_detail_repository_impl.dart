import 'package:benchease/presentation/dashboard/data/services/dashboard_api_service.dart';
import 'package:benchease/presentation/dashboard/domain/models/hotskill_response.dart';

import '../../../../application/application.dart';
import 'employee_detail_repository.dart';

class EmployeeDetailRepositoryImpl implements EmployeeDetailRepository {
  EmployeeDetailRepositoryImpl(this._apiService);

  final DashboardApiService _apiService;

  @override
  Future<void> generateCV() async {
    try {
      await _apiService.generateCV();
    } catch (_) {
      logger.e(_);
    }
  }
}
