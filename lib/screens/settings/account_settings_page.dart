import 'package:bizconnect/screens/user/profile_controller.dart';
import 'package:bizconnect/screens/user/user_register_page_controller.dart';
import 'package:bizconnect/widgets/overloading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

// class AccountSettingsPage extends StatefulWidget {
//   const AccountSettingsPage({super.key});
//   @override
//   State<AccountSettingsPage> createState() => _AccountSettingsPageState();
// }

class AccountSettingsPage extends GetView<ProfileController> {
  const AccountSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return 
       XLoadingOverlay(
        loading: controller.loading,
         child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: Get.height,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual image path
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Upload photo action
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD4AF37), // Gold color
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  // Delete photo action
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Delete Photo",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
               
                    Form(
                      key: controller.profile,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Form Fields
                
                    _buildTextField(
                      controller: controller.fullNameController,
                      label: "Name",
                      validator: controller.notEmptyValidator,
                      ),
                    SizedBox(height: 10),
               
              
                    _buildTextField(
                      controller: controller.userNameController,
                      label: "ID",
                      validator: controller.notEmptyValidator,
                      ),
                    SizedBox(height: 10),
               
              
                    _buildTextField(
                      controller: controller.useremailController,
                      label: "Email",
                      validator: controller.notEmptyValidator,
                      isreadOnly: true
                      ),
                    SizedBox(height: 10),
               
                    // Text("Password"),
                    // TextField(
                    //   controller: TextEditingController(text: "************"),
                    //   obscureText: true,
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // SizedBox(height: 10),
               
               
                     _buildTextField(
                      controller: controller.dobController,
                      label: "Date of Birth",
                      validator: controller.notEmptyValidator,
                      ),
                    SizedBox(height: 10),
               
                    Text("Country/Region"),
                    DropdownButtonFormField<String>(
                      value: "United Arab Emirates",
                      onChanged: (String? newValue) {
                        controller.selectedCountry.value = newValue;
                      },
                      items: controller.countries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    SizedBox(height: 20),
               
                    // Save Changes Button
                    Center(
                      child: InkWell(
                        onTap: controller.updateProfile,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFD4AF37), // Gold color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    ],)),
               
                    
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
               ),
    );
  }
   Widget _buildTextField({
    required String label,
     IconData? icon,
    required TextEditingController controller,
    required FormFieldValidator<String?> validator,
    TextInputType keyboardType = TextInputType.name,
    bool isPassword = false,
    bool isreadOnly = false,

  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14),
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
            readOnly: isreadOnly,
            obscureText: isPassword,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              constraints: const BoxConstraints(minHeight: 60),
              prefixIcon: icon == null ? null : Icon(icon, color: Colors.amber[700]),
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
}
