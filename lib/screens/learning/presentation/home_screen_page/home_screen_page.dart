import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../utils/exports.dart';
import '../../../home/bottom_bar_page.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../categories_screen/models/categoriesgrid_item_model.dart';
import '../featured_course_screen/controller/featured_course_controller.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'models/slidre_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));
  CategoriesController categoriesController = Get.put(CategoriesController());
  FeaturedCourseController featuredCourseController =
      Get.put(FeaturedCourseController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double margin = 16.h;
    int crossCount = 4;

    double width = (MediaQuery.of(context).size.width - (margin * crossCount)) /
        crossCount;
    double height = 105.v;
    return ListView(
      children: [
        _buildAppBar(),
        Padding(
            padding: EdgeInsets.only(right: 16.h, left: 16.h),
            child: CustomSearchView(
                onTap: () {
                  Get.toNamed(AppRoutes.searchScreen);
                },
                textInputType: TextInputType.none,
                controller: controller.searchController,
                hintText: "lbl_search".tr)),
        SizedBox(height: 16.h),
        CarouselSlider.builder(
            options: CarouselOptions(
              height: 134.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              SliderData model = controller.sliderData[index];
              return Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                child: Container(
                  height: 134.v,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      image: DecorationImage(
                          image: AssetImage(model.image!), fit: BoxFit.fill)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.h, right: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 168.h,
                          child: Text(model.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(height: 1.50, color: Colors.black)),
                        ),
                        SizedBox(
                          height: 16.v,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text("lbl_book_now".tr,
                                  style: CustomTextStyles.titleMediumMonaSans),
                              CustomImageView(
                                  imagePath: ImageConstant.imgIcArrowRight,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin: EdgeInsets.only(left: 4.h))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        SizedBox(height: 20.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("lbl_categories".tr, style: theme.textTheme.titleMedium!),
              GestureDetector(
                  onTap: () {
                    onTapTxtViewAll();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 3.v),
                      child: Text("lbl_view_all".tr,
                          style: CustomTextStyles.bodyMediumOnPrimary
                              .copyWith(color: appTheme.viewAllButtonColor))))
            ],
          ),
        ),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
          crossAxisCount: crossCount,
          crossAxisSpacing: margin,
          mainAxisSpacing: margin,
          childAspectRatio: width / height,
          children: List.generate(
              categoriesController.categories.length > 4
                  ? 4
                  : categoriesController.categories.length, (index) {
            CategoriesgridItemModel data =
                categoriesController.categories[index];
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 0.v,
              ),
              decoration: AppDecoration.fillIndigo.copyWith(
                color: data.bgColor,
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    height: 47.adaptSize,
                    width: 47.adaptSize,
                    padding: EdgeInsets.all(11.h),
                    decoration: IconButtonStyleHelper.fillWhiteATL27,
                    child: CustomImageView(
                      imagePath: data.icon!,
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    data.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("msg_featured_courses".tr,
                  style: theme.textTheme.titleMedium!),
              GestureDetector(
                onTap: () {
                  onTapTxtViewAll1();
                },
                child: Padding(
                    padding: EdgeInsets.only(bottom: 3.v),
                    child: Text("lbl_view_all".tr,
                        style: CustomTextStyles.bodyMediumOnPrimary
                            .copyWith(color: appTheme.viewAllButtonColor))),
              )
            ],
          ),
        ),
        SizedBox(height: 16.v),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 240.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h),
                physics: BouncingScrollPhysics(),
                itemCount:
                    featuredCourseController.featuredCourceList.length > 2
                        ? 2
                        : featuredCourseController.featuredCourceList.length,
                itemBuilder: (context, index) {
                  FavoritegridItemModel model =
                      featuredCourseController.featuredCourceList[index];
                  return animationfunction(
                      index,
                      FavoritegridItemWidget(model, onTapFund: () {
                        Get.toNamed(AppRoutes.courseDetailsAboutScreen);
                      }));
                })),
        SizedBox(height: 16.v),
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 99.v,
        leading: IconButton(onPressed: (){
          Get.to(() => BottomBarPage());
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Container(
            margin: EdgeInsets.only(left: 45.h),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "lbl_welcome_back".tr,
                      style: theme.textTheme.titleMedium),
                  TextSpan(text: " \n".tr, style: theme.textTheme.bodyLarge),
                  TextSpan(
                      text: "${Faker.instance.name.fullName()}",
                      style: theme.textTheme.titleLarge)
                ]),
                textAlign: TextAlign.left)),
        actions: [
          AppbarTrailingIconbutton(
              onTap: () {
                Get.toNamed(AppRoutes.notificationsScreen);
              },
              imagePath: ImageConstant.imgLock,
              margin: EdgeInsets.fromLTRB(16.h, 9.v, 16.h, 26.v))
        ]);
  }

  /// Navigates to the courseDetailsAboutScreen when the action is triggered.
  onTapUserProfile() {
    Get.toNamed(AppRoutes.courseDetailsAboutScreen);
  }

  /// Navigates to the categoriesScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  /// Navigates to the featuredCourseScreen when the action is triggered.
  onTapTxtViewAll1() {
    Get.toNamed(
      AppRoutes.featuredCourseScreen,
    );
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapTxtViewAll2() {
    Get.toNamed(
      AppRoutes.popularCoursesScreen,
    );
  }
}
