import 'dart:math';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../models/comment_model.dart';
import '../../utils/exports.dart';

class CommentWidget extends StatefulWidget {
  final CommentModel comment;

  const CommentWidget({super.key, required this.comment});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    if (widget.comment.type == CommentType.video) {
      flickManager = FlickManager(
        autoPlay: false,
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.comment.content),
        ),
      );
    }
  }

  @override
  void dispose() {
    if (widget.comment.type == CommentType.video) {
      flickManager.flickControlManager!.pause();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int number = Random.secure().nextInt(60);
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                Faker.instance.image.image(height: 300 + number, width: 300 + number)), // First letter of the username
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Faker.instance.name.fullName(),
                      style: GoogleFonts.manrope(
                        color: Color(0xFF191919),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.14,
                      ),
                    ),
                    const SizedBox(width: 5.83),
                    Text(
                      'just now',
                      style: GoogleFonts.manrope(
                        color: Color(0x66191919),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                _buildCommentContent(widget.comment),
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

  Widget _buildCommentContent(CommentModel comment) {
    switch (comment.type) {
      case CommentType.text:
        return Text(
          comment.content,
          style: TextStyle(fontSize: 14, color: Colors.black87),
        );
      case CommentType.sticker:
        return Image.network(
          comment.content,
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        );
      // case CommentType.voice:
      //   return VoiceMessage(
      //     audioSrc:  comment.content,
      //     played: false,
      //     width: Get.width,
      //     noiseHeight: 30,
      //     noiseWidth: 150,
      //     contactPlayIconBgColor: primaryColor.withOpacity(0.5),
      //     waveBgColor: primaryColor,
      //     waveColor: primaryColor,
      //     me: false,
      //     onPlay: () {},
      //     header: {}, // Do something when voice played.
      //   );
      case CommentType.video:
        return SizedBox(
          width: Get.width * 0.6,
          child: FlickVideoPlayer(
            flickManager: flickManager,
          ),
        );
    }
  }
}
