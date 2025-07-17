import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/appointment_model.dart';
import '../../data/repo/appointment_repo.dart';

import 'appointment_status.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo repo;
  AppointmentCubit(this.repo) : super(AppointmentInitial());

  Future<void> fetchAppointments({required int pageNumber, required int pageSize}) async {
    emit(AppointmentLoading());
    try {
      final res = await repo.getAppointments(pageNumber: pageNumber, pageSize: pageSize);
      logger.i('Appointments Response: $res');
      final response = AppointmentModel.fromJson(res);
      emit(AppointmentSuccess(response));
    } catch (e) {
      emit(AppointmentFailure(e.toString()));
    }
  }
}