import '../../../core/app_export.dart';
import '../models/call_details_model.dart';

/// A controller class for the CallDetailsScreen.
///
/// This class manages the state of the CallDetailsScreen, including the
/// current callDetailsModelObj
class CallDetailsController extends GetxController {
  Rx<CallDetailsModel> callDetailsModelObj = CallDetailsModel().obs;
}
