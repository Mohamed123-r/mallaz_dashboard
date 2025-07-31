import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/appointment_repo.dart';


abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}
class EditNoteLoading extends EditNoteState {}
class EditNoteSuccess extends EditNoteState {
  final String message;
  EditNoteSuccess(this.message);
}
class EditNoteFailure extends EditNoteState {
  final String error;
  EditNoteFailure(this.error);
}

class EditNoteCubit extends Cubit<EditNoteState> {
  final AppointmentRepo repo;
  EditNoteCubit(this.repo) : super(EditNoteInitial());

  Future<void> editNote({
    required int appointmentId,
    required String note,
  }) async {
    emit(EditNoteLoading());
    try {
      final res = await repo.editAppointmentNote(appointmentId: appointmentId, note: note);
      if (res.success) {
        emit(EditNoteSuccess(res.message));
      } else {
        emit(EditNoteFailure(res.message));
      }
    } catch (e) {
      emit(EditNoteFailure(e.toString()));
    }
  }
}