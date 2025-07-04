import '../../data/models/add_new_properties_model.dart';

abstract class PropertyRequestState {}

class PropertyRequestInitial extends PropertyRequestState {}

class PropertyRequestLoading extends PropertyRequestState {}

class PropertyRequestSuccess extends PropertyRequestState {
  final List<PropertyRequestModel> requests;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPage;

  PropertyRequestSuccess(
      this.requests, {
        required this.totalCount,
        required this.pageNumber,
        required this.pageSize,
        required this.totalPage,
      });
}

class PropertyRequestFailure extends PropertyRequestState {
  final String error;
  PropertyRequestFailure(this.error);
}