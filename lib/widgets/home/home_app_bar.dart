import 'package:bizconnect/utils/colors.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const HomeAppBar({super.key, required this.title, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            BootstrapIcons.search,
            size: 20,
          ),
        ),
        Stack(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.email_outlined,
                size: 20,
              ),
            ),
            Positioned(
              right: 4.94,
              top: 4.94,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/home/pro.png",
              height: 29,
            )),
        InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              child: Icon(
                BootstrapIcons.chat_dots,
                size: 23,
              ),
            )),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
