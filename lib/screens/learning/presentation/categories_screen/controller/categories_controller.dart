import '../../../core/app_export.dart';

import '../models/categories_model.dart';
import '../models/categoriesgrid_item_model.dart';

/// A controller class for the CategoriesScreen.
///
/// This class manages the state of the CategoriesScreen, including the
/// current categoriesModelObj
class CategoriesController extends GetxController {
 List<CategoriesgridItemModel> categories = CategoriesModel.getCategoriesData();
}
