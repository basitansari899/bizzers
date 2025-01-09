import 'package:bizconnect/screens/learning/core/app_export.dart';
import 'package:flutter/material.dart';

import '../custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 36.adaptSize,
          width: 36.adaptSize,
          decoration: IconButtonStyleHelper.fillOnErrorContainer,
          child: Padding(
            padding:  EdgeInsets.all(7.v),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgLock,
            ),
          ),
        ),
      ),
    );
  }
}
