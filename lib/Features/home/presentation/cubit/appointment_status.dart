import '../../data/models/appointment_model.dart';


abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final AppointmentModel appointments;
  AppointmentSuccess(this.appointments);
}

class AppointmentFailure extends AppointmentState {
  final String error;
  AppointmentFailure(this.error);
}

class  AppointmentDetailsSuccess extends AppointmentState {
  final AppointmentDetailsModel appointmentDetails;
  AppointmentDetailsSuccess(this.appointmentDetails);
}

class AppointmentDetailsFailure extends AppointmentState {
  final String error;
  AppointmentDetailsFailure(this.error);
}

class AppointmentDetailsLoading extends AppointmentState {}