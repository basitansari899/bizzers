import 'package:google_fonts/google_fonts.dart';

import '../../models/comment_model.dart';
import '../../utils/exports.dart';

class CommentWidget extends StatefulWidget {
  final CommentModel comment;

  const CommentWidget({super.key, required this.comment});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(widget.comment.userPic), // First letter of the username
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.comment.user,
                      style: GoogleFonts.manrope(
                        color: Color(0xFF191919),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.14,
                      ),
                    ),
                    const SizedBox(width: 5.83),
                    Text(
                      _getTimeAgo(widget.comment.updateAt),
                      style: GoogleFonts.manrope(
                        color: Color(0x66191919),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  widget.comment.content,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Like',
                      style: GoogleFonts.manrope(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Reply',
                      style: GoogleFonts.manrope(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hr ago';
    } else {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    }
  }

  // Widget _buildCommentContent(CommentModel comment) {
  //   switch (comment.commentType) {
  //     case 'Text':
  //       return Text(
  //         comment.content,
  //         style: TextStyle(fontSize: 14, color: Colors.black87),
  //       );
  //     case CommentType.sticker:
  //       return Image.network(
  //         comment.content,
  //         height: 60,
  //         width: 60,
  //         fit: BoxFit.cover,
  //       );
  //     case CommentType.voice:
  //       return VoiceMessage(
  //         audioSrc:  comment.content,
  //         played: false,
  //         width: Get.width,
  //         noiseHeight: 30,
  //         noiseWidth: 150,
  //         contactPlayIconBgColor: primaryColor.withOpacity(0.5),
  //         waveBgColor: primaryColor,
  //         waveColor: primaryColor,
  //         me: false,
  //         onPlay: () {},
  //         header: {}, // Do something when voice played.
  //       );
  //     case CommentType.video:
  //       return SizedBox(
  //         width: Get.width * 0.6,
  //         child: FlickVideoPlayer(
  //           flickManager: flickManager,
  //         ),
  //       );
  //   }
  // }
}
