import '../../utils/exports.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});
  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: 20),

                // Form Fields
                Text("Name"),
                TextField(
                  controller: TextEditingController(text: "Haris Siddiqui"),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                Text("ID"),
                TextField(
                  controller: TextEditingController(text: "@harrissid"),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                Text("Email"),
                TextField(
                  controller: TextEditingController(text: "harissiddiqui9@gmail.com"),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                Text("Password"),
                TextField(
                  controller: TextEditingController(text: "************"),
                  obscureText: true,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                Text("Date of Birth"),
                TextField(
                  controller: TextEditingController(text: "28/10/1998"),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                Text("Country/Region"),
                DropdownButtonFormField<String>(
                  value: "United Arab Emirates",
                  onChanged: (String? newValue) {
                    // Handle change
                  },
                  items: <String>['United Arab Emirates', 'United States', 'Canada', 'India']
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
                    onTap: () {
                      // Save changes action
                    },
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
