import 'package:bizconnect/screens/home/ads_page.dart';
import 'package:bizconnect/screens/home/explore_page.dart';
import 'package:bizconnect/screens/home/home_page.dart';
import 'package:bizconnect/screens/home/live_streaming_page.dart';
import 'package:bizconnect/screens/home/store_page.dart';
import 'package:bizconnect/utils/exports.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class BottomBarModel{
  final String title;
  final IconData iconData;
  final IconData selectIcon;
  final Widget page;
  BottomBarModel({required this.title, required this.iconData, required this.selectIcon, required this.page});
}
List<BottomBarModel> bars = [
  BottomBarModel(title: "Home", iconData: BootstrapIcons.house_door, selectIcon: BootstrapIcons.house_door_fill, page: HomePage()),
  BottomBarModel(title: "Live", iconData: BootstrapIcons.broadcast, selectIcon: BootstrapIcons.broadcast_pin, page: LiveStreamingPage()),
  BottomBarModel(title: "Explore", iconData: BootstrapIcons.compass, selectIcon: BootstrapIcons.compass_fill, page: ExplorePage()),
  BottomBarModel(title: "Store", iconData: BootstrapIcons.shop, selectIcon: BootstrapIcons.shop, page: StorePage()),
  BottomBarModel(title: "Ads", iconData: BootstrapIcons.house_door, selectIcon: BootstrapIcons.house_door_fill, page: AdsPage()),
];