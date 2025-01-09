import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

import '../models/result_not_found_model.dart';

/// A controller class for the ResultNotFoundScreen.
///
/// This class manages the state of the ResultNotFoundScreen, including the
/// current resultNotFoundModelObj
class ResultNotFoundController extends GetxController {
  TextEditingController mACHINELEARNINGController = TextEditingController();

  Rx<ResultNotFoundModel> resultNotFoundModelObj = ResultNotFoundModel().obs;

  @override
  void onClose() {
    super.onClose();
    mACHINELEARNINGController.dispose();
  }
}
