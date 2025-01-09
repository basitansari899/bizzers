import 'package:bizconnect/utils/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'screens/learning/core/utils/initial_bindings.dart';
import 'screens/learning/localization/app_localization.dart';
import 'screens/learning/routes/app_routes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BizConnect',
      theme: lightTheme,
      getPages: AppRoutes.pages,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      home: const SplashScreen(),
    );
  }
}
