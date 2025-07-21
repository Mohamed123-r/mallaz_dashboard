import '../../../home/data/models/appointment_model.dart';
import '../../data/models/property_details_model.dart';

abstract class PropertyDetailsState {}

class PropertyDetailsInitial extends PropertyDetailsState {}

class PropertyDetailsLoading extends PropertyDetailsState {}

class PropertyDetailsSuccess extends PropertyDetailsState {
  final PropertyDetailsModel details;
  PropertyDetailsSuccess(this.details);
}

class PropertyDetailsFailure extends PropertyDetailsState {
  final String error;
  PropertyDetailsFailure(this.error);
}
