import 'package:bizconnect/utils/assets.dart';

class BoardingModel{
  final String title;
  final String image;
  final String description;
  final bool last;
  BoardingModel({required this.title, required this.image, required this.description, this.last = false});
} 

List<BoardingModel> boardings = [
  BoardingModel(title: "A Hub for Business Promotion", image: AssetsImage.assetsAuthBoarding1, description: "Creating a marketplace for business promotion involves designing a platform"),
  BoardingModel(title: "Connect With Different peoples", image: AssetsImage.assetsAuthBoarding2, description: "A Space where people connect with each other especially in a business and professional standpoint."),
  BoardingModel(title: "Explore the Different Communities", image: AssetsImage.assetsAuthBoarding3, description: "Exploring different communities for fostering engagement, interaction, and collaboration ",last: true),
];