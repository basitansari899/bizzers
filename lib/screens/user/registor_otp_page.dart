import 'package:pinput/pinput.dart';

import '../../utils/exports.dart';
import 'all_done_page.dart';

class RegistorOtpPage extends StatefulWidget {
  const RegistorOtpPage({super.key});

  @override
  State<RegistorOtpPage> createState() => _RegistorOtpPageState();
}

class _RegistorOtpPageState extends State<RegistorOtpPage> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Enter OTP',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDAA520),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Enter the OTP code we just sent\nyou on your registered Email/Phone number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 40),
            Pinput(
              length: 4,
              controller: otpController,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () => Get.to(() => AllDonePage()),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFDAA520),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Add resend OTP logic here
              },
              child: Text(
                "Didn't get OTP? Resend OTP",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 30,
                  color: Colors.grey[300],
                ),
                SizedBox(width: 10),
                Container(
                  height: 5,
                  width: 30,
                  color: Color(0xFFDAA520),
                ),
                SizedBox(width: 10),
                Container(
                  height: 5,
                  width: 30,
                  color: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.13,
            )
          ],
        ),
      ),
    );
  }
}
