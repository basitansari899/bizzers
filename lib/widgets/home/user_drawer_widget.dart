import 'package:bizconnect/screens/learning/routes/app_routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../screens/learning/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import '../../utils/exports.dart';

class UserDrawerWidget extends StatefulWidget {
  const UserDrawerWidget({super.key});

  @override
  State<UserDrawerWidget> createState() => _UserDrawerWidgetState();
}

class _UserDrawerWidgetState extends State<UserDrawerWidget> {
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(23)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                Faker.instance.name.fullName(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "@${Faker.instance.name.firstName()}",
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your profile image asset
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.acount),
                    child: DrawerItem(
                      icon: BootstrapIcons.person,
                      title: "Account",
                    ),
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.card_text,
                    title: "My Subscription",
                  ),
                  SizedBox(height: 14),
                  Divider(),
                  InkWell(
                    onTap: () => Get.to(
                      () => HomeScreenContainerScreen(),
                    ),
                    child: DrawerItem(
                      icon: BootstrapIcons.mortarboard,
                      title: "Learning",
                    ),
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.sliders,
                    title: "General",
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.shield_lock,
                    title: "Privacy",
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.bell,
                    title: "Notification",
                  ),
                  Row(
                    children: [
                      DrawerItem(
                        icon: BootstrapIcons.moon,
                        title: "Appearance",
                      ),
                      Spacer(),
                      Switch(value: false, onChanged: (bool value) {}),
                      SizedBox(width: 16),
                    ],
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.tools,
                    title: "Advance",
                  ),
                  DrawerItem(
                    icon: BootstrapIcons.gift,
                    title: "Rewards",
                  ),
                  SizedBox(height: 14),
                  Divider(),
                  DrawerItem(
                    icon: BootstrapIcons.question_circle,
                    title: "Help",
                  ),
                  InkWell(
                    onTap: () async {
    try {
      // Ensure that firebaseAuth is not null before proceeding
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.signOut();
        Get.offAllNamed(AppRoutes.login); // Navigate to login screen after sign-out
      } else {
        throw Exception('No user is currently logged in.');
      }
    } catch (e) {
      // Display a more informative error message
      Get.snackbar('Logout Failed', 'Error: $e', snackPosition: SnackPosition.BOTTOM);
      print('Error during logout: $e');
    }
  },
                    child: DrawerItem(
                      icon: BootstrapIcons.box_arrow_right,
                      title: "Log Out",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 18),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 14),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
