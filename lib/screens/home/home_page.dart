import 'package:bizconnect/screens/home/controllers/post_model.dart';
import 'package:bizconnect/widgets/home/home_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/exports.dart';
import '../../widgets/global/post_widget.dart';
import '../../widgets/home/home_stories_widget.dart';
import '../../widgets/home/user_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title: "Home"),
      drawer: UserDrawerWidget(),
      body: Column(
        children: [
          HomeStoriesWidget(),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
          
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No posts available"));
                }
          
                final posts = snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return PostModel.fromJson(doc.id, data);
                }).toList();
          
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      
                      ...posts.map((post) => PostWidget(post: post)),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
