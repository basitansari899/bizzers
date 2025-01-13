import 'package:bizconnect/screens/home/controllers/post_comment_controller.dart';
import 'package:bizconnect/screens/home/controllers/post_model.dart';
import 'package:bizconnect/widgets/global/widget_post_comment_bar.dart';
import 'package:bizconnect/widgets/global/user_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../models/comment_model.dart';
import '../../utils/exports.dart';
import '../../widgets/global/add_comment_widget.dart';
import '../../widgets/global/comment_widget.dart';

class PostDetailsPage extends StatefulWidget {
  final PostModel post;
  const PostDetailsPage({super.key, required this.post});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final postCommentController = Get.find<PostCommentController>();
    Widget postText() {
      return Container(
        padding: EdgeInsets.all(11),
        child: ReadMoreText(
          widget.post.postDescription,
          trimMode: TrimMode.Line,
          trimLines: 2,
          annotations: [
            Annotation(
              regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
              spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
                text: text,
                style: textStyle?.copyWith(color: primaryColor),
              ),
            ),
            Annotation(
              regExp: RegExp(r'<@(\d+)>'),
              spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
                text: "@${Faker.instance.name.firstName()}",
                style: textStyle?.copyWith(color: primaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle tap, e.g., navigate to a user profile
                  },
              ),
            ),
            // Additional annotations for URLs...
          ],
          moreStyle: GoogleFonts.manrope(
            color: Color(0xFF121212),
            fontSize: 13.40,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    Widget postContent() {
      return Container(
        width: Get.width,
        height: 346,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.post.postImage),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: UserAppBarWidget(
        userPic: widget.post.userImage,
        name: widget.post.name,
        userName: widget.post.username,
      ),
      body: Container(
        margin: EdgeInsets.all(14),
        child: ListView(
          children: [
            postContent(),
            WidgetPostCommentBar(post: widget.post),
            postText(),
            SizedBox(
              height: 14,
            ),
            AddCommentWidget(userPic: widget.post.userImage),
            SizedBox(height: 14),
            StreamBuilder<List<CommentModel>>(
              stream: postCommentController.getThisPostComments(widget.post.postId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while waiting for data
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Display error if there's any
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No comments available'); // Handle case with no comments
                }

                // Build the list of comments
                return Column(
                  children: snapshot.data!.map((c) {
                    return Column(
                      children: [
                        CommentWidget(comment: c),
                        Divider(),
                      ],
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
