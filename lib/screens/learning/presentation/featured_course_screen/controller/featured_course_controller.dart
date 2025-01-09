import '../../../core/app_export.dart';

import '../models/favoritegrid_item_model.dart';
import '../models/featured_course_model.dart';

/// A controller class for the FeaturedCourseScreen.
///
/// This class manages the state of the FeaturedCourseScreen, including the
/// current featuredCourseModelObj
class FeaturedCourseController extends GetxController {
 List<FavoritegridItemModel> featuredCourceList = FeaturedCourseModel.getFeaturedCource();
}
