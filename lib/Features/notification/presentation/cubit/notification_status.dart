
import '../../data/models/notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class NotificationLoading extends NotificationState {}
class NotificationSuccess extends NotificationState {}
class NotificationFailure extends NotificationState {
  final String error;
  NotificationFailure(this.error);
}
class NotificationListLoaded extends NotificationState {
  final NotificationModel notifications;
  NotificationListLoaded(this.notifications);
}
