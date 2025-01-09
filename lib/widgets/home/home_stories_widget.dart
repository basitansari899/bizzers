import 'package:advstory/advstory.dart';
import 'package:bizconnect/utils/exports.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStoriesWidget extends StatelessWidget {
  final color;
  const HomeStoriesWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: AdvStory(
        style: AdvStoryStyle(
            indicatorStyle: IndicatorStyle(
          valueColor: primaryColor,
        )),
        storyCount: 15,
        storyBuilder: (storyIndex) => Story(
          contentCount: 3,
          contentBuilder: (contentIndex) => ImageContent(
            url: Faker.instance.image
                .image(height: 400 + contentIndex, width: 400 + contentIndex),
          ),
        ),
        trayBuilder: (index) {
          return AdvStoryTray(
            shape: BoxShape.circle,
            borderGradientColors: [
              primaryColor,
              primaryColor.withValues(alpha: 0.3),
              primaryColor.withValues(alpha: 0.6),
              primaryColor.withValues(alpha: 0.9),
            ],
            url: Faker.instance.image
                .image(height: 400 + index, width: 400 + index),
            username: Text(
              Faker.instance.name.firstName(),
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 12.63,
                color: color ?? Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}

