import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/exports.dart';

bool profileB = false;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String currentTab = 'Posts';

  @override
  void initState() {
    profileB = !profileB;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 345,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                _buildHeaderBackground(),
                _buildProfileImage(),
                _buildProfileInfo(),
                _buildStatsRow(),
                _buildSettingsIcon(),
                _buildBackButton(),
              ],
            ),
          ),
          Visibility(
            visible: profileB,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              width: Get.width,
              height: 36.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGradientButton('Connect'),
                  _buildOutlinedButton('Follow'),
                  _buildOutlinedButton('Share'),
                  _buildCircularButton(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          Visibility(
            visible: profileB,
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  width: Get.width,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Posts",
                      "Products",
                      "Connects",
                      "Likes",
                    ].map((text) {
                      bool selected = currentTab == text;
                      return Container(
                        width: Get.width / 4 - 20,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: selected? ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 7.80,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ):null,
                        child: Text(
                          text,
                          style: selected
                              ? TextStyle(
                            fontSize: 15.74,
                            fontWeight: FontWeight.w600,
                          )
                              : TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 15.74,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.custom(
                padding: EdgeInsets.symmetric(horizontal: 17),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(3, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    String imageUrl = Faker.instance.image
                        .image(width: 300 + index, height: 300 + index);
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(6.64),
                        child: Image.network(imageUrl, fit: BoxFit.cover));
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(String label) {
    return Container(
      width: 110.73,
      height: 36.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFDAA30A), Color(0xFFD3A921), Color(0xFFD2A623)],
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: _buttonTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(String label) {
    return Container(
      width: 110.73,
      height: 36.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.39),
          borderRadius: BorderRadius.circular(200),
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: _buttonTextStyle,
        ),
      ),
    );
  }

  Widget _buildCircularButton() {
    return Container(
      width: 36.39,
      height: 36.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.39),
          borderRadius: BorderRadius.circular(200),
        ),
      ),
      child: Icon(Icons.keyboard_arrow_down_sharp),
    );
  }

  Widget _buildSegment(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  TextStyle get _buttonTextStyle => TextStyle(
        fontSize: 15.3,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w500,
      );

  Widget _buildHeaderBackground() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 197,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(getImage(197, 412)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Positioned(
      top: 144,
      left: 15,
      child: Container(
        width: 92,
        height: 92,
        decoration: ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(width: 1, color: Color(0xFFBA9551))),
          image: DecorationImage(
            image: AssetImage("assets/profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Positioned(
      top: 251,
      left: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${Faker.instance.name.fullName()}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.88,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('@${Faker.instance.name.firstName()}',
              style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 11.59)),
          Text(
            Faker.instance.company.companyName(),
            style: TextStyle(
                color: Color(0xFFDAA30A),
                fontSize: 15.74,
                fontWeight: FontWeight.w500),
          ),
          Text('www.hscosmetics.com',
              style: TextStyle(color: Colors.black, fontSize: 15.74)),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Positioned(
      top: 211,
      left: 163,
      child: Row(
        children: [
          _buildStatColumn('24', 'Promotions'),
          SizedBox(width: 18),
          _buildStatColumn('34', 'Connects'),
          SizedBox(width: 18),
          _buildStatColumn('30', 'Engagement'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String stat, String label) {
    return Column(
      children: [
        Text(stat,
            style: TextStyle(fontSize: 17.4, fontWeight: FontWeight.w500)),
        Text(label,
            style: TextStyle(fontSize: 10.82, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildSettingsIcon() {
    return Positioned(
      top: 50,
      right: 10,
      child: IconButton(
        icon: Icon(Icons.settings, size: 30),
        onPressed: () {
          // Add functionality here
        },
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 50,
      left: 10,
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 24),
        onPressed: () => Get.back(),
      ),
    );
  }
}
