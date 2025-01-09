import '../../../core/app_export.dart';
import '../models/videocall_details_model.dart';

/// A controller class for the VideocallDetailsScreen.
///
/// This class manages the state of the VideocallDetailsScreen, including the
/// current videocallDetailsModelObj
class VideocallDetailsController extends GetxController {
  Rx<VideocallDetailsModel> videocallDetailsModelObj =
      VideocallDetailsModel().obs;
}
