import 'package:bizconnect/screens/learning/core/app_export.dart';
import 'package:bizconnect/screens/user/login_page_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/exports.dart';
import 'forgtet_password_page.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[700],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: controller.loginKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            label: 'Email address',
                            icon: BootstrapIcons.envelope,
                            controller: controller.email,
                            validator: controller.emailValidator,
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            label: 'Password',
                            icon: BootstrapIcons.lock,
                            isPassword: true,
                            controller: controller.password,
                            validator: controller.passwordValidator,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.to(() => ForgtetPasswordPage()),
                        child: Text(
                          'Forget Password',
                          style: GoogleFonts.poppins(color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (val) => controller.termsAndCondition.value = val!,
                          activeColor: primaryColor,
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: GoogleFonts.poppins(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => controller.loginUser(), //Get.to(() => BottomBarPage()),
                      child: Obx(
                        () => Container(
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
                          child: controller.loading.value
                              ? CircularProgressIndicator()
                              : Center(
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.singUp),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber[700]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.amber[700],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Or',
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    _buildSocialButton(
                      text: 'Login with Google',
                      icon: "assets/auth/g.png",
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    _buildSocialButton(
                      text: 'Login with Facebook',
                      icon: "assets/auth/fb.png",
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    _buildSocialButton(
                      text: 'Login with LinkedIn',
                      icon: "assets/auth/link.png",
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required FormFieldValidator<String?> validator,
    TextInputType keyboardType = TextInputType.name,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFF5F9FD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: TextFormField(
            obscureText: isPassword,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              constraints: const BoxConstraints(minHeight: 60),
              prefixIcon: Icon(icon, color: Colors.amber[700]),
              filled: false,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber[700]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber[700]!),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String text,
    required String icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        // Add social login functionality
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE9E9E9)),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: 18,
            ),
            const SizedBox(width: 8),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
