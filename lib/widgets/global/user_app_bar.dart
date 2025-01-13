import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

class UserAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBarWidget({
    super.key,
    required this.userPic,
    required this.name,
    required this.userName,
  });
  final String userPic;
  final String name;
  final String userName;
  @override
  Widget build(BuildContext context) {
    Widget userWidget() {
      return Row(
        children: [
          Container(
            width: 45.20,
            height: 45.20,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  userPic,
                ),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.manrope(
                  color: Color(0xFF121212),
                  fontSize: 13.70,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "@$userName",
                style: GoogleFonts.manrope(
                  color: Colors.black,
                  fontSize: 11.59,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return AppBar(
      centerTitle: false,
      surfaceTintColor: Colors.white,
      title: userWidget(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
