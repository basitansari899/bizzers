import '../../../widgets/custom_rating_bar.dart';
import '../controller/customer_reviews_controller.dart';
import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

    var controller = Get.find<CustomerReviewsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Row(
            children: [
              CustomImageView(
                imagePath: userprofileItemModelObj.image!,
                height: 56.adaptSize,
                width: 56.adaptSize,
                radius: BorderRadius.circular(
                  28.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 17.h,
                  top: 4.v,
                  bottom: 3.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userprofileItemModelObj.name!,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 8.v),
                    CustomRatingBar(
                      color: appTheme.amber500,
                      ignoreGestures: true,
                      initialRating: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.v),
          Container(
            width: 325.h,
            margin: EdgeInsets.only(right: 25.h),
            child: Text(
              userprofileItemModelObj.review!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
