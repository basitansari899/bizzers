import 'package:bizconnect/screens/learning/core/app_export.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.assetsAuthLogo,height: Get.height*0.2,),
            SizedBox(height: 24),
            Text(
              'Hi, Welcome to Bizz Connect!',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: Color(0xFFDAA30A),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Create an account and enjoy starting \nBizz Connect',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 65),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFDAA30A), Color(0xFFD3A921), Color(0xFFD2A623)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: InkWell(
                onTap: (){

                },
                child: Text(
                  "Join as a Business",
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFDAA30A), Color(0xFFD3A921), Color(0xFFD2A623)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: InkWell(
                onTap: () => Get.toNamed(AppRoutes.login),
                child: Text(
                  "Join as customer/user",
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
