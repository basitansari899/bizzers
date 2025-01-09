import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/option_model.dart';
import '../../utils/exports.dart';

class WidgetPostCommentBar extends StatefulWidget {
  const WidgetPostCommentBar({super.key});

  @override
  State<WidgetPostCommentBar> createState() => _WidgetPostCommentBarState();
}

class _WidgetPostCommentBarState extends State<WidgetPostCommentBar> {
  @override
  Widget build(BuildContext context) {
    Widget commentsBar() {
      var commentStyle = GoogleFonts.manrope(
        color: Color(0xFF0C1014),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
      return Container(
        margin: EdgeInsets.all(11),
        child: Row(
          children: [
            SizedBox(width: 10),
            Row(
              children: [
                Icon(
                  BootstrapIcons.heart_fill,
                  color: Color(0xFFE01D1D),
                ),
                SizedBox(width: 4),
                Text(
                  '456',
                  style: commentStyle,
                ),
              ],
            ),
            SizedBox(width: 14),
            Row(
              children: [
                Icon(BootstrapIcons.chat_dots),
                SizedBox(width: 4),
                Text(
                  '456',
                  style: commentStyle,
                ),
              ],
            ),
            SizedBox(width: 14),
            Row(
              children: [
                Icon(BootstrapIcons.send),
                SizedBox(width: 4),
                Text(
                  '456',
                  style: commentStyle,
                ),
              ],
            ),
            Spacer(),
            PopupMenuButton(
              color: Get.theme.cardColor,
              offset: const Offset(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(10),
              surfaceTintColor: Colors.transparent,
              itemBuilder: (context) {
                return menuOptions.map((option) {
                  return PopupMenuItem(
                    height: 40,
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          Icon(option.icon, size: 16, color: Color(0xFF766F68)),
                          const SizedBox(width: 8),
                          Text(
                            option.title,
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF766F68),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList();
              },
              child: Icon(BootstrapIcons.three_dots_vertical),
            )
          ],
        ),
      );
    }
    return commentsBar();
  }
}
