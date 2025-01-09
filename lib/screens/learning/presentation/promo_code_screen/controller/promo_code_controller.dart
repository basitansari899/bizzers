import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

import '../models/promo_code_model.dart';

/// A controller class for the PromoCodeScreen.
///
/// This class manages the state of the PromoCodeScreen, including the
/// current promoCodeModelObj
class PromoCodeController extends GetxController {
  TextEditingController enterhereController = TextEditingController();

  Rx<PromoCodeModel> promoCodeModelObj = PromoCodeModel().obs;

  @override
  void onClose() {
    super.onClose();
    enterhereController.dispose();
  }
}
