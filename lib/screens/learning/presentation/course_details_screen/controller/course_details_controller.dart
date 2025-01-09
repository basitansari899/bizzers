import '../../../core/app_export.dart';

import '../models/course_details_model.dart';
import '../models/widget_item_model.dart';

/// A controller class for the CourseDetailsScreen.
///
/// This class manages the state of the CourseDetailsScreen, including the
/// current courseDetailsModelObj
class CourseDetailsController extends GetxController {
 List<WidgetItemModel> lessonList =CourseDetailsModel.getLessonsList();
}
