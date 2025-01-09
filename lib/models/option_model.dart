import 'package:bootstrap_icons/bootstrap_icons.dart';

import '../utils/exports.dart';

class MenuOptionModel {
  final IconData icon;
  final String title;

  MenuOptionModel({required this.icon, required this.title});
}

final List<MenuOptionModel> menuOptions = [
  MenuOptionModel(icon: BootstrapIcons.person, title: "View Profile"),
  MenuOptionModel(icon: BootstrapIcons.bookmark, title: "Save Post"),
  MenuOptionModel(icon: BootstrapIcons.star, title: "Mark as Favorite"),
  MenuOptionModel(icon: BootstrapIcons.share, title: "Share"),
  MenuOptionModel(icon: BootstrapIcons.flag, title: "Report Post"),
  MenuOptionModel(icon: BootstrapIcons.eye_slash, title: "Hide Post from This User"),
  MenuOptionModel(icon: BootstrapIcons.bell, title: "Turn on Post Notifications"),
  MenuOptionModel(icon: BootstrapIcons.ban, title: "Mute User"),
];
