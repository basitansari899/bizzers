import 'package:bizconnect/screens/home/bottom_bar_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
      final uid = auth.currentUser?.uid;
      if (uid != null) {
        Get.offAll(() => BottomBarPage());
      } else {
        Get.offAll(() => BoardingScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
