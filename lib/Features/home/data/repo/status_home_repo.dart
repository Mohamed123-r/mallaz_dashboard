
import '../models/status_home_model.dart';

abstract class DashboardStatsRepo {
  Future<Map<String ,dynamic>> getDashboardStats();
}