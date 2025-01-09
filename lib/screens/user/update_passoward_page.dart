import '../../utils/exports.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Reset Password',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDAA520),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(fontFamily: 'Poppins'),
              decoration: InputDecoration(
                hintText: 'Enter new password',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              style: TextStyle(fontFamily: 'Poppins'),
              decoration: InputDecoration(
                hintText: 'Confirm new password',
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: InkWell(
                onTap: () {
                  // Add your submit logic here
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFDAA520),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Submitting...',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Container(
                  height: 5,
                  width: 30,
                  color: Color(0xFFDAA520),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.13),
          ],
        ),
      ),
    );
  }
}
