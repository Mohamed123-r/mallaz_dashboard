import 'package:bloc/bloc.dart';
import 'package:book_apartment_dashboard/constant.dart';

import '../../data/models/property_model.dart';
import '../../data/repo/property_repo.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepo propertyRepo;

  PropertyCubit({required this.propertyRepo}) : super(PropertyInitial());

  void fetchProperties({
    required String propertyType,
    required int pageNumber,
    required int pageSize,
    String? propertySaleStatus,
    String? propertyRentStatus,
  }) async {
    emit(PropertyLoading());
    try {
      final properties = await propertyRepo.fetchProperties(
        propertyType: propertyType,
        pageNumber: pageNumber,
        pageSize: pageSize,
        propertySaleStatus: propertySaleStatus,
        propertyRentStatus: propertyRentStatus,
      );
      emit(PropertyLoaded(properties: properties));
    } catch (e) {
      emit(PropertyError(message: e.toString()));
    }
  }
  Future<int> fetchPropertiesCount({
    required String propertyType,
    String? propertySaleStatus,
    String? propertyRentStatus,
  }) async {
    try {
      final properties = await propertyRepo.fetchProperties(
        propertyType: propertyType,
        pageNumber: 1,
        pageSize: 1, // نحتاج فقط العدد
        propertySaleStatus: propertySaleStatus,
        propertyRentStatus: propertyRentStatus,
      );
      logger.e(properties.totalCount);
      return properties.totalCount;
    } catch (e) {
      return 0;
    }
  }
}
