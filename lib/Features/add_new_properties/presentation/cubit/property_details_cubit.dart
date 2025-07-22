import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/cubit/property_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/property_details_model.dart';
import '../../data/repo/property_details_repo.dart';

class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
  final PropertyDetailsRepo repo;
  PropertyDetailsCubit(this.repo) : super(PropertyDetailsInitial());

  Future<void> fetchPropertyDetails(int propertyId) async {
    emit(PropertyDetailsLoading());
    try {
      final details = await repo.getPropertyDetails(propertyId);
      emit(PropertyDetailsSuccess(details));
    } catch (e) {
      emit(PropertyDetailsFailure(e.toString()));
    }
  }
  Future<void> updatePropertyDetails(PropertyDetailsModel property) async {
    emit(PropertyDetailsLoading());
    try {
      await repo.updatePropertyDetails(property);
      emit(PropertyDetailsSuccess(property));
    } catch (e) {
      emit(PropertyDetailsFailure(
          e.toString()
      ));
    }
  }
}
