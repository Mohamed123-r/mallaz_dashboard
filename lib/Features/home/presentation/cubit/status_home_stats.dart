
import '../../data/models/status_home_model.dart';

abstract class DashboardStatsState {}

class DashboardStatsInitial extends DashboardStatsState {}

class DashboardStatsLoading extends DashboardStatsState {}

class DashboardStatsSuccess extends DashboardStatsState {
  final Map<dynamic,dynamic> stats;
  DashboardStatsSuccess(this.stats);
}

class DashboardStatsFailure extends DashboardStatsState {
  final String error;
  DashboardStatsFailure(this.error);
}