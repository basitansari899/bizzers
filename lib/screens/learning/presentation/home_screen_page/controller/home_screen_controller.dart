import 'package:flutter/material.dart';

/// A controller class for the HomeScreenPage.
import '../../../core/app_export.dart';

import '../models/home_screen_model.dart';
import '../models/slidre_model.dart';

///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
 List<SliderData> sliderData = HomeScreenModel.getSliderData();
  HomeScreenController(this.homeScreenModelObj);
  TextEditingController searchController = TextEditingController();
  Rx<HomeScreenModel> homeScreenModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }
}
