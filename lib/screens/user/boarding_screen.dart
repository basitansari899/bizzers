import 'package:bizconnect/models/boarding_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int activeIndex = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: Get.height,width: Get.width,
            child: PageView(
              controller: pageController,
              onPageChanged: (i){
                setState(() {
                  activeIndex = i;
                });
              },
              children: boardings.map((item){
                return Column(
                  children: [
                    Image.asset(item.image,width: Get.width),
                    SizedBox(height: 80),
                    SizedBox(
                      width: 326,
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          color: Color(0xFF323232),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 326,
                      child: Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 80,
            width: Get.width - 50,
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFDAA30A), Color(0xFFD3A921), Color(0xFFD2A623)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: InkWell(
                onTap: (){
                  if(boardings[activeIndex].last){
                    Get.offAll(() => WelcomePage());
                  }else{
                    activeIndex = activeIndex+1;
                    pageController.jumpToPage(activeIndex);
                    setState(() {});
                  }
                },
                child: Text(
                 boardings[activeIndex].last? "Get Started":'Next',
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
