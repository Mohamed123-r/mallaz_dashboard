abstract class AppointmentRepo {
  Future<Map<String, dynamic>> getAppointments({required int pageNumber, required int pageSize});
}