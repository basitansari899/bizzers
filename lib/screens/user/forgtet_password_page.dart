import 'package:bizconnect/screens/user/otp_verify_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

class ForgtetPasswordPage extends StatefulWidget {
  const ForgtetPasswordPage({super.key});

  @override
  State<ForgtetPasswordPage> createState() => _ForgtetPasswordPageState();
}

class _ForgtetPasswordPageState extends State<ForgtetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Forget Password',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email ID/ Mobile Number',
                hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                fillColor: Color(0xFFF5F9FD),
                border: InputBorder.none,
              ),
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
               Get.to(() => OtpVerifyPage());
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDAA30A),
                      Color(0xFFD3A921),
                      Color(0xFFD2A623),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPageIndicator(isActive: true),
                const SizedBox(width: 8),
                _buildPageIndicator(isActive: false),
                const SizedBox(width: 8),
                _buildPageIndicator(isActive: false),
              ],
            ),
            SizedBox(height: Get.height*0.13),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator({required bool isActive}) {
    return Container(
      width: 20,
      height: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.amber[700] : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
