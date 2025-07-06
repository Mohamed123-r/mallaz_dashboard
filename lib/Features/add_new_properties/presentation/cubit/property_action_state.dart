import '../../data/models/property_action_model.dart';

abstract class PropertyActionsState {}

class PropertyActionsInitial extends PropertyActionsState {}

class PropertyActionsLoading extends PropertyActionsState {}

class PropertyActionSuccess extends PropertyActionsState {
  final PropertyActionResponse response;
  PropertyActionSuccess(this.response);
}

class PropertyActionFailure extends PropertyActionsState {
  final String error;
  PropertyActionFailure(this.error);
}