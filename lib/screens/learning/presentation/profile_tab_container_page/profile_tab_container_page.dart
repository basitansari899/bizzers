import '../../../../utils/exports.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/profile_tab_container_controller.dart';
import 'models/profile_tab_container_model.dart';
import 'package:flutter/material.dart';

class ProfileTabContainerPage extends StatefulWidget {
  ProfileTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<ProfileTabContainerPage> createState() => _ProfileTabContainerPageState();
}

class _ProfileTabContainerPageState extends State<ProfileTabContainerPage> {
  ProfileTabContainerController controller =
      Get.put(ProfileTabContainerController(ProfileTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Column(
      children: [
        _buildHeader(),
        Column(
          children: [
            SizedBox(height: 40.v),
            CustomImageView(
              imagePath: ImageConstant.imgAvtar1,
              height: 100.adaptSize,
              width: 100.adaptSize,
            ),
            SizedBox(height: 18.v),
            Text(
              "lbl_guest_user".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 18.v),
            _buildTabview(),
            SizedBox(
              height: 457.v,
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  Scaffold(),
                  Scaffold(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
        centerTitle: true,
        title: AppbarSubtitle(
          text: "lbl_profile".tr,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 58.v,
      width: 396.h,
      decoration: BoxDecoration(
        color: appTheme.gray10002,
        borderRadius: BorderRadius.circular(
          12.h,
        ),
      ),
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        tabs: [
          Tab(
            child: Text(
              "lbl_log_in".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_sign_up".tr,
            ),
          ),
        ],
      ),
    );
  }
}
