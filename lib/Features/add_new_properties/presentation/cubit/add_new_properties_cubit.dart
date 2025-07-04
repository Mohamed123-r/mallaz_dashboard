import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/add_new_properties_repo.dart';

import 'add_new_properties_stats.dart';


class PropertyRequestCubit extends Cubit<PropertyRequestState> {
  final PropertyRequestRepo repo;
  PropertyRequestCubit(this.repo) : super(PropertyRequestInitial());

  Future<void> fetchRequests({
    int pageNumber = 1,
    int pageSize = 6,
    String? propertyType,
  }) async {
    emit(PropertyRequestLoading());
    try {
      final res = await repo.getRequestsToAddProperties(
        pageNumber: pageNumber,
        pageSize: pageSize,
        propertyType: propertyType,
      );
      emit(PropertyRequestSuccess(
        res.data,
        totalCount: res.totalCount,
        pageNumber: res.pageNumber,
        pageSize: res.pageSize,
        totalPage: res.totalPage,
      ));

    } catch (e) {
      emit(PropertyRequestFailure(e.toString()));
    }
  }
}