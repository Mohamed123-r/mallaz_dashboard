import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';

import 'appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final DioConsumer dioConsumer;

  AppointmentRepoImpl({required this.dioConsumer});

  @override
  Future<Map<String, dynamic>> getAppointments({
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await dioConsumer.get(
      '${EndPoint.appointments}PageNumber=$pageNumber&PageSize=$pageSize',
    );
    return response;
  }
  @override
  Future<Map<String, dynamic>> getAppointmentDetails({required int appointmentId}) async {
    try {
      final response = await dioConsumer.get(
        '/api/Appointment/$appointmentId',
      );
      return response ;
    } catch (e) {
      throw Exception('Failed to fetch appointment details: $e');
    }
  }

}
