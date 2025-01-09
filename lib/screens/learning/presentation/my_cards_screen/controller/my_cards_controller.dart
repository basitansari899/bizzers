
/// A controller class for the MyCardsScreen.
import '../../../core/app_export.dart';

import '../models/my_cards_data.dart';
import '../models/my_cards_model.dart';

///
/// This class manages the state of the MyCardsScreen, including the
/// current myCardsModelObj
class MyCardsController extends GetxController {
 List<MyCardsModel> cardData = MyCardsData.getCardData();
 int currentCardId = 1;
}
