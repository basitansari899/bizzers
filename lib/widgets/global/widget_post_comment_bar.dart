import 'package:bizconnect/screens/home/controllers/home_controller.dart';
import 'package:bizconnect/screens/home/controllers/post_like_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/option_model.dart';
import '../../utils/exports.dart';
import 'package:get/get.dart';

// class WidgetPostCommentBar extends StatefulWidget {
//   final String postId;
//   final String postCounts;
//   const WidgetPostCommentBar({super.key,required this.postId, required this.postCounts});

//   @override
//   State<WidgetPostCommentBar> createState() => _WidgetPostCommentBarState();
// }

class WidgetPostCommentBar extends StatelessWidget  {
    final String postId;
  final int postCounts;
  const WidgetPostCommentBar({super.key,required this.postId, required this.postCounts});
  @override
  Widget build(BuildContext context) {
     final postLikeController = Get.put(PostLikeController(postId: postId));
    Widget commentsBar() {
      var commentStyle = GoogleFonts.manrope(
        color: Color(0xFF0C1014),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
      return Builder(
        builder: (context) {
          return Container(
            margin: EdgeInsets.all(11),
            child: Row(
              children: [
                SizedBox(width: 10),
                // Like button with real-time updates
          Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: postLikeController.toggleLike,
                  child: Icon(
                    BootstrapIcons.heart_fill,
                    color: postLikeController.isLiked.value
                        ? Color(0xFFE01D1D)
                        : Color(0xFFB0B0B0),
                  ),
                );
              }),
              SizedBox(width: 4),
              Obx(() {
                return Text(
                  postLikeController.likeCount.value.toString(),
                  style: commentStyle,
                );
              }),
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
      );
    }
    return commentsBar();
  }
}
