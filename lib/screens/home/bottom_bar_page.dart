import '../../models/bottombar_model.dart';
import '../../utils/exports.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bars[currentIndex].page,
      bottomNavigationBar: Container(
        width: 412,
        padding: EdgeInsets.only(top: 5),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.24),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 20.30,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: BottomNavigationBar(
            useLegacyColorScheme: true,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: (i) => setState(() {
                  currentIndex = i;
                }),
            items: bars.map((item) {
              return BottomNavigationBarItem(
                  label: item.title,
                  icon: item.title == "Ads"
                      ? ImageIcon(AssetImage("assets/home/ads.png"))
                      : Icon(
                          item.iconData,
                        ),
                  activeIcon: item.title == "Ads"
                      ? ImageIcon(AssetImage("assets/home/ads.png"))
                      : Icon(item.selectIcon));
            }).toList()),
      ),
    );
  }
}
