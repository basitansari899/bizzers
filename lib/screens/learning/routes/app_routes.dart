import 'package:bizconnect/screens/user/login_page.dart';
import 'package:bizconnect/screens/user/login_page_binding.dart';
import 'package:bizconnect/screens/user/user_register_page.dart';
import 'package:bizconnect/screens/user/user_register_page_binding.dart';

import '../presentation/add_new_cards1_screen/add_new_cards1_screen.dart';
import '../presentation/add_new_cards1_screen/binding/add_new_cards1_binding.dart';
import '../presentation/add_new_cards_screen/add_new_cards_screen.dart';
import '../presentation/add_new_cards_screen/binding/add_new_cards_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/book_success_screen/binding/book_success_binding.dart';
import '../presentation/book_success_screen/book_success_screen.dart';
import '../presentation/call_details_screen/binding/call_details_binding.dart';
import '../presentation/call_details_screen/call_details_screen.dart';
import '../presentation/cart_screen/binding/cart_binding.dart';
import '../presentation/cart_screen/cart_screen.dart';
import '../presentation/categories_screen/binding/categories_binding.dart';
import '../presentation/categories_screen/categories_screen.dart';
import '../presentation/chat_details_screen/binding/chat_details_binding.dart';
import '../presentation/chat_details_screen/chat_details_screen.dart';
import '../presentation/chat_list_tab_container_screen/binding/chat_list_tab_container_binding.dart';
import '../presentation/chat_list_tab_container_screen/chat_list_tab_container_screen.dart';
import '../presentation/course_details_about_screen/binding/course_details_about_binding.dart';
import '../presentation/course_details_about_screen/course_details_about_screen.dart';
import '../presentation/course_details_screen/binding/course_details_binding.dart';
import '../presentation/course_details_screen/course_details_screen.dart';
import '../presentation/customer_reviews_screen/binding/customer_reviews_binding.dart';
import '../presentation/customer_reviews_screen/customer_reviews_screen.dart';
import '../presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import '../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../presentation/favorite_screen/binding/favorite_binding.dart';
import '../presentation/favorite_screen/favorite_screen.dart';
import '../presentation/featured_course_screen/binding/featured_course_binding.dart';
import '../presentation/featured_course_screen/featured_course_screen.dart';
import '../presentation/home_screen_container_screen/binding/home_screen_container_binding.dart';
import '../presentation/home_screen_container_screen/home_screen_container_screen.dart';
import '../presentation/instructor_details_screen/binding/instructor_details_binding.dart';
import '../presentation/instructor_details_screen/instructor_details_screen.dart';
import '../presentation/lessons_screen/binding/lessons_binding.dart';
import '../presentation/lessons_screen/lessons_screen.dart';
import '../presentation/my_cards_screen/binding/my_cards_binding.dart';
import '../presentation/my_cards_screen/my_cards_screen.dart';
import '../presentation/my_courses_screen/binding/my_courses_binding.dart';
import '../presentation/my_courses_screen/my_courses_screen.dart';
import '../presentation/my_profile_screen/binding/my_profile_binding.dart';
import '../presentation/my_profile_screen/my_profile_screen.dart';
import '../presentation/notifications_screen/binding/notifications_binding.dart';
import '../presentation/notifications_screen/notifications_screen.dart';
import '../presentation/payment_method_screen/binding/payment_method_binding.dart';
import '../presentation/payment_method_screen/payment_method_screen.dart';

import '../presentation/promo_code_screen/binding/promo_code_binding.dart';
import '../presentation/promo_code_screen/promo_code_screen.dart';
import '../presentation/reset_password_screen/binding/reset_password_binding.dart';
import '../presentation/reset_password_screen/reset_password_screen.dart';
import '../presentation/reset_password_success_screen/binding/reset_password_success_binding.dart';
import '../presentation/reset_password_success_screen/reset_password_success_screen.dart';
import '../presentation/result_found_screen/binding/result_found_binding.dart';
import '../presentation/result_found_screen/result_found_screen.dart';
import '../presentation/result_not_found_screen/binding/result_not_found_binding.dart';
import '../presentation/result_not_found_screen/result_not_found_screen.dart';
import '../presentation/search_screen/binding/search_binding.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/videocall_details_screen/binding/videocall_details_binding.dart';
import '../presentation/videocall_details_screen/videocall_details_screen.dart';
import 'package:get/get.dart';

import '../presentation/video_screen/video_screen/binding/video_binding.dart';
import '../presentation/video_screen/video_screen/video_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingScreen = '/onboarding_screen';

  static const String onboardingScreenOneScreen = '/onboarding_screen_one_screen';

  static const String onboarding1Screen = '/onboarding1_screen';

  static const String login = '/login';
  static const String singUp = '/sign_up';

  static const String logInScreen = '/log_in_screen';

  static const String logInScreenWirhErrorScreen = '/log_in_screen_wirh_error_screen';

  static const String logInScreenWithActiveScreen = '/log_in_screen_with_active_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String resetPasswordSuccessScreen = '/reset_password_success_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenContainerScreen = '/home_screen_container_screen';

  static const String categoriesScreen = '/categories_screen';

  static const String featuredCourseScreen = '/featured_course_screen';

  static const String popularCoursesScreen = '/popular_courses_screen';

  static const String courseDetailsAboutScreen = '/course_details_about_screen';

  static const String lessonsScreen = '/lessons_screen';

  static const String customerReviewsScreen = '/customer_reviews_screen';

  static const String cartScreen = '/cart_screen';

  static const String promoCodeScreen = '/promo_code_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String bookSuccessScreen = '/book_success_screen';

  static const String searchScreen = '/search_screen';

  static const String resultFoundScreen = '/result_found_screen';

  static const String resultNotFoundScreen = '/result_not_found_screen';

  static const String popularInstructorScreen = '/popular_instructor_screen';

  static const String instructorDetailsScreen = '/instructor_details_screen';

  static const String myCoursesScreen = '/my_courses_screen';

  static const String myCourses1Page = '/my_courses1_page';

  static const String courseDetailsScreen = '/course_details_screen';

  static const String favoriteScreen = '/favorite_screen';

  static const String favorite1Page = '/favorite1_page';

  static const String chatsPage = '/chats_page';

  static const String chatListPage = '/chat_list_page';

  static const String chatListTabContainerScreen = '/chat_list_tab_container_screen';

  static const String callListPage = '/call_list_page';

  static const String chatDetailsScreen = '/chat_details_screen';

  static const String callDetailsScreen = '/call_details_screen';

  static const String videocallDetailsScreen = '/videocall_details_screen';

  static const String profilePage = '/profile_page';

  static const String profileTabContainerPage = '/profile_tab_container_page';

  static const String profileOneScreen = '/profile_one_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String myCardsScreen = '/my_cards_screen';

  static const String addNewCardsScreen = '/add_new_cards_screen';

  static const String addNewCards1Screen = '/add_new_cards1_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String logOutScreen = '/log_out_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String videoScreen = '/VideoScreen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: singUp,
      page: () => const UserRegisterPage(),
      binding: UserRegisterPageBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: resetPasswordSuccessScreen,
      page: () => ResetPasswordSuccessScreen(),
      bindings: [
        ResetPasswordSuccessBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: homeScreenContainerScreen,
      page: () => HomeScreenContainerScreen(),
      bindings: [
        HomeScreenContainerBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: categoriesScreen,
      page: () => CategoriesScreen(),
      bindings: [
        CategoriesBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: featuredCourseScreen,
      page: () => FeaturedCourseScreen(),
      bindings: [
        FeaturedCourseBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: courseDetailsAboutScreen,
      page: () => CourseDetailsAboutScreen(),
      bindings: [
        CourseDetailsAboutBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: lessonsScreen,
      page: () => LessonsScreen(),
      bindings: [
        LessonsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: customerReviewsScreen,
      page: () => CustomerReviewsScreen(),
      bindings: [
        CustomerReviewsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: cartScreen,
      page: () => CartScreen(),
      bindings: [
        CartBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: promoCodeScreen,
      page: () => PromoCodeScreen(),
      bindings: [
        PromoCodeBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: bookSuccessScreen,
      page: () => BookSuccessScreen(),
      bindings: [
        BookSuccessBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: resultFoundScreen,
      page: () => ResultFoundScreen(),
      bindings: [
        ResultFoundBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: resultNotFoundScreen,
      page: () => ResultNotFoundScreen(),
      bindings: [
        ResultNotFoundBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: instructorDetailsScreen,
      page: () => InstructorDetailsScreen(),
      bindings: [
        InstructorDetailsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: myCoursesScreen,
      page: () => MyCoursesScreen(),
      bindings: [
        MyCoursesBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: courseDetailsScreen,
      page: () => CourseDetailsScreen(),
      bindings: [
        CourseDetailsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: favoriteScreen,
      page: () => FavoriteScreen(),
      bindings: [
        FavoriteBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: chatListTabContainerScreen,
      page: () => ChatListTabContainerScreen(),
      bindings: [
        ChatListTabContainerBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: chatDetailsScreen,
      page: () => ChatDetailsScreen(),
      bindings: [
        ChatDetailsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: callDetailsScreen,
      page: () => CallDetailsScreen(),
      bindings: [
        CallDetailsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: videocallDetailsScreen,
      page: () => VideocallDetailsScreen(),
      bindings: [
        VideocallDetailsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: myCardsScreen,
      page: () => MyCardsScreen(),
      bindings: [
        MyCardsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: addNewCardsScreen,
      page: () => AddNewCardsScreen(),
      bindings: [
        AddNewCardsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: addNewCards1Screen,
      page: () => AddNewCards1Screen(),
      bindings: [
        AddNewCards1Binding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      bindings: [
        NotificationsBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: videoScreen,
      page: () => VideoScreen(),
      bindings: [VideoBinding()],
    ),
  ];
}
