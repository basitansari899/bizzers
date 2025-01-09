import 'package:flutter/material.dart';

/// A controller class for the CourseDetailsAboutScreen.
import '../../../core/app_export.dart';
import '../models/course_details_about_model.dart';

///
/// This class manages the state of the CourseDetailsAboutScreen, including the
/// current courseDetailsAboutModelObj
class CourseDetailsAboutController extends GetxController {
  TextEditingController elevenController = TextEditingController();

  Rx<CourseDetailsAboutModel> courseDetailsAboutModelObj =
      CourseDetailsAboutModel().obs;

  int currentPage = 0;

  @override
  void onClose() {
    super.onClose();
    elevenController.dispose();
  }
}
