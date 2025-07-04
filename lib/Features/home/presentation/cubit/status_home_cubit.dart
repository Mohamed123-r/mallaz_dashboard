import 'package:book_apartment_dashboard/Features/home/presentation/cubit/status_home_stats.dart';
import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/status_home_model.dart';
import '../../data/repo/status_home_repo.dart';


class DashboardStatsCubit extends Cubit<DashboardStatsState> {
  final DashboardStatsRepo repo;
  DashboardStatsCubit(this.repo) : super(DashboardStatsInitial());

  Future<void> fetchDashboardStats() async {
    emit(DashboardStatsLoading());
    try {
      final res = await repo.getDashboardStats();
      logger .i('Dashboard Stats Response: $res');
      emit(DashboardStatsSuccess(
        res["data"].map<dynamic, dynamic>((key, value) => MapEntry(key, value)),

      ));
    } catch (e) {
      emit(DashboardStatsFailure(e.toString()));
    }
  }
}