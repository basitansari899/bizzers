import '../../../core/app_export.dart';

import '../models/fundlist_item_model.dart';
import '../models/my_courses1_model.dart';

/// A controller class for the MyCourses1Page.
///
/// This class manages the state of the MyCourses1Page, including the
/// current myCourses1ModelObj
class MyCourses1Controller extends GetxController {
 List<FundlistItemModel> myCourcesList = MyCourses1Model.getMyCourcesList();
}
