import 'package:bizconnect/screens/home/controllers/post_comment_controller.dart';

import '../../utils/exports.dart';

class AddCommentWidget extends StatefulWidget {
  final String? userPic;
  const AddCommentWidget({super.key, this.userPic});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final postCommentController = Get.find<PostCommentController>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: _saveComment,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: false,
        hintText: "Add a comment...",
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(BootstrapIcons.mic, size: 20),
            // SizedBox(width: 6),
            // Icon(BootstrapIcons.emoji_dizzy, size: 20),
            // SizedBox(width: 6),
            Icon(Icons.add, size: 20),
            SizedBox(width: 8),
          ],
        ),
        prefixIcon: widget.userPic == null
            ? null
            : Container(
                margin: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    widget.userPic!,
                    height: 18,
                    width: 18,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }

  void _saveComment(String comment) {
    if (comment.isNotEmpty) {
      postCommentController.saveComment(comment, widget.userPic!);
      controller.clear();
    }
  }
}
