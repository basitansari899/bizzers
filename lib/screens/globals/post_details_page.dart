import 'dart:math';

import 'package:bizconnect/widgets/global/widget_post_comment_bar.dart';
import 'package:bizconnect/widgets/global/user_app_bar.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../models/comment_model.dart';
import '../../utils/exports.dart';
import '../../widgets/global/add_comment_widget.dart';
import '../../widgets/global/comment_widget.dart';
import '../../widgets/global/post_widget.dart';

class PostDetailsPage extends StatefulWidget {
 final String postId;
  const PostDetailsPage({super.key, this.postId = '1'});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {

    Widget postText() {
      return Container(
        padding: EdgeInsets.all(11),
        child: ReadMoreText(
          texts[Random.secure().nextInt(texts.length - 1)],
          trimMode: TrimMode.Line,
          trimLines: 2,
          annotations: [
            Annotation(
              regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
              spanBuilder: ({required String text, TextStyle? textStyle}) =>
                  TextSpan(
                    text: text,
                    style: textStyle?.copyWith(color: primaryColor),
                  ),
            ),
            Annotation(
              regExp: RegExp(r'<@(\d+)>'),
              spanBuilder: ({required String text, TextStyle? textStyle}) =>
                  TextSpan(
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
            image: NetworkImage(
              Faker.instance.image.image(
                width: Get.width.toInt(),
                height: 346,
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: UserAppBarWidget(),
      body: Container(
        margin: EdgeInsets.all(14),
        child: ListView(
          children: [
            postContent(),
            WidgetPostCommentBar(postId: widget.postId,postCounts: 1234,),
            postText(),
            SizedBox(height: 14,),
            AddCommentWidget(),
            SizedBox(height: 14,),
            for(var c in comments)
              Column(
                children: [
                  CommentWidget(comment: c),
                  Divider(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
