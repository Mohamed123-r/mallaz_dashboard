import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/cubit/property_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/property_action_repo.dart';


class PropertyActionsCubit extends Cubit<PropertyActionsState> {
  final PropertyActionsRepo repo;
  PropertyActionsCubit(this.repo) : super(PropertyActionsInitial());

  Future<void> acceptProperty(int propertyId) async {
    emit(PropertyActionsLoading());
    try {
      final res = await repo.acceptProperty(propertyId);
      emit(PropertyActionSuccess(res));
    } catch (e) {
      emit(PropertyActionFailure(e.toString()));
    }
  }

  Future<void> deleteProperty(int propertyId) async {
    emit(PropertyActionsLoading());
    try {
      final res = await repo.deleteProperty(propertyId);
      emit(PropertyActionSuccess(res));
    } catch (e) {
      emit(PropertyActionFailure(e.toString()));
    }
  }

  void reset() => emit(PropertyActionsInitial());
}