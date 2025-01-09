import '../../../core/app_export.dart';
import '../models/chats_model.dart';

/// A controller class for the ChatsPage.
///
/// This class manages the state of the ChatsPage, including the
/// current chatsModelObj
class ChatsController extends GetxController {
  ChatsController(this.chatsModelObj);

  Rx<ChatsModel> chatsModelObj;
}
