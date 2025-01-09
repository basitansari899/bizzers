import 'package:bizconnect/widgets/home/home_app_bar.dart';

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
      body: ListView(
        children: [
          HomeStoriesWidget(),
          for (int i = 0; i < 30; i++) PostWidget(),
        ],
      ),
    );
  }
}
