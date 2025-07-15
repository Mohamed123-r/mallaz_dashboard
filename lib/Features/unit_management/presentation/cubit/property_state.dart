part of 'property_cubit.dart';


abstract class PropertyState {}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<PropertyModel> properties;

  PropertyLoaded({required this.properties});
}

class PropertyError extends PropertyState {
  final String message;

  PropertyError({required this.message});
}