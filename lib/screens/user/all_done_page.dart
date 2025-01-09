import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';
import '../home/bottom_bar_page.dart';

class AllDonePage extends StatefulWidget {
  const AllDonePage({super.key});

  @override
  State<AllDonePage> createState() => _AllDonePageState();
}

class _AllDonePageState extends State<AllDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.13,
              ),
              Image.asset("assets/auth/cel.png"),
              SizedBox(height: 24),
              Text(
                'All done!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDAA520),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Your account has been created. You\'re now ready to explore and enjoy all the features and benefits we have to offer.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 32),
              InkWell(
                onTap: () => Get.to(() => BottomBarPage()),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFDAA520),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Start Exploring App',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
