import '../../../core/app_export.dart';

import '../models/notificationrow_item_model.dart';
import '../models/notifications_model.dart';

/// A controller class for the NotificationsScreen.
///
/// This class manages the state of the NotificationsScreen, including the
/// current notificationsModelObj
class NotificationsController extends GetxController {
  List<NotificationrowItemModel> getNotificationList =
      NotificationsModel.getNotificationData();
}
