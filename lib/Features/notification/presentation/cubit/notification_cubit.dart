import 'package:book_apartment_dashboard/Features/notification/data/models/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/notification_repo.dart';
import 'notification_status.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;

  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> sendNotification(String title, String description) async {
    emit(NotificationLoading());
    try {
      final success = await repo.sendNotification(title, description);
      if (success) {
        emit(NotificationSuccess());
        fetchNotifications(); // بعد الإرسال، هات القائمة
      } else {
        emit(NotificationFailure("فشل الإرسال"));
      }
    } catch (e) {
      emit(NotificationFailure(e.toString()));
    }
  }

  Future<void> fetchNotifications({
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    emit(NotificationLoading());
    try {
      final list = await repo.fetchNotifications(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      emit(NotificationListLoaded(NotificationModel.fromJson(list)));
    } catch (e) {
      emit(NotificationFailure(e.toString()));
    }
  }
}
