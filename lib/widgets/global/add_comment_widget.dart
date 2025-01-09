import 'package:bootstrap_icons/bootstrap_icons.dart';

import '../../utils/exports.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({super.key});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: false,
        hintText: "Add a comment...",
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(BootstrapIcons.mic,size: 20,),
            SizedBox(width: 6),
            Icon(BootstrapIcons.emoji_dizzy,size: 20,),
            SizedBox(width: 6),
            Icon(Icons.add,size: 20,),
            SizedBox(width: 8),
          ],
        ),
        prefixIcon: Container(
          margin: EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/profile.jpg",height: 18,)),
        ),
      ),
    );
  }
}
