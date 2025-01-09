import '../../../core/app_export.dart';
import '../models/my_courses_model.dart';

/// A controller class for the MyCoursesScreen.
///
/// This class manages the state of the MyCoursesScreen, including the
/// current myCoursesModelObj
class MyCoursesController extends GetxController {
  Rx<MyCoursesModel> myCoursesModelObj = MyCoursesModel().obs;
}
