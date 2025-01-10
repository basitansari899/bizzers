import 'dart:math';

import 'package:bizconnect/models/post_model.dart';
import 'package:bizconnect/screens/home/controllers/post_like_controller.dart';
import 'package:bizconnect/screens/home/controllers/post_model.dart';
import 'package:bizconnect/widgets/global/widget_post_comment_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../screens/globals/post_details_page.dart';
import '../../screens/globals/profile_page.dart';
import '../../utils/exports.dart';

// class PostWidget extends StatefulWidget {
//   const PostWidget({super.key});

//   @override
//   State<PostWidget> createState() => _PostWidgetState();
// }

// class _PostWidgetState extends State<PostWidget> {
//   @override
//   Widget build(BuildContext context) {
//     Widget userWidget() {
//       return Container(
//         padding: EdgeInsets.only(top: 11, left: 11, right: 11),
//         child: Row(
//           children: [
//             Container(
//               width: 45.20,
//               height: 45.20,
//               decoration: ShapeDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     Faker.instance.image.image(width: 200, height: 200),
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//                 shape: OvalBorder(),
//               ),
//             ),
//             SizedBox(width: 12),
//             InkWell(
//               onTap: () => Get.to(() => ProfileScreen()),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     Faker.instance.name.fullName(),
//                     style: GoogleFonts.manrope(
//                       color: Color(0xFF121212),
//                       fontSize: 13.70,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "@${Faker.instance.name.firstName()}",
//                     style: GoogleFonts.manrope(
//                       color: Colors.black,
//                       fontSize: 11.59,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
//                 decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   "Follow",
//                   style: GoogleFonts.manrope(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget postText() {
//       return Container(
//         padding: EdgeInsets.all(11),
//         child: ReadMoreText(
//           texts[Random.secure().nextInt(texts.length - 1)],
//           trimMode: TrimMode.Line,
//           trimLines: 2,
//           annotations: [
//             Annotation(
//               regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
//               spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
//                 text: text,
//                 style: textStyle?.copyWith(color: primaryColor),
//               ),
//             ),
//             Annotation(
//               regExp: RegExp(r'<@(\d+)>'),
//               spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
//                 text: "@${Faker.instance.name.firstName()}",
//                 style: textStyle?.copyWith(color: primaryColor),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     // Handle tap, e.g., navigate to a user profile
//                   },
//               ),
//             ),
//             // Additional annotations for URLs...
//           ],
//           moreStyle: GoogleFonts.manrope(
//             color: Color(0xFF121212),
//             fontSize: 13.40,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       );
//     }

//     Widget postContent() {
//       return Container(
//         width: Get.width,
//         height: 346,
//         decoration: ShapeDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               Faker.instance.image.image(
//                 width: Get.width.toInt(),
//                 height: 346,
//               ),
//             ),
//             fit: BoxFit.cover,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.50),
//           ),
//         ),
//       );
//     }

//     return GestureDetector(
//       onTap: () => Get.to(() => PostDetailsPage()),
//       child: Container(
//         margin: EdgeInsets.all(8),
//         decoration: ShapeDecoration(
//           color: Color(0xFFFFF7E7),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(3),
//           ),
//           shadows: [
//             BoxShadow(
//               color: Color(0x26000000),
//               blurRadius: 9.52,
//               offset: Offset(0, 0),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             userWidget(),
//             postText(),
//             postContent(),
//             SizedBox(height: 5),
//             WidgetPostCommentBar(),
//             SizedBox(height: 5),
//           ],
//         ),
//       ),
//     );
//   }
// }
class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget userWidget() {
      return Container(
        padding: EdgeInsets.only(top: 11, left: 11, right: 11),
        child: Row(
          children: [
            Container(
              width: 45.20,
              height: 45.20,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.userImage),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(),
              ),
            ),
            SizedBox(width: 12),
            InkWell(
              onTap: () => Get.to(() => ProfileScreen(
                // userId: post.userId
                )), // Pass userId if required
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name,
                    style: GoogleFonts.manrope(
                      color: Color(0xFF121212),
                      fontSize: 13.70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "@${post.username}",
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 11.59,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Follow",
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget postText() {
      return Container(
        padding: EdgeInsets.all(11),
        child: ReadMoreText(
          post.postDescription,
          trimMode: TrimMode.Line,
          trimLines: 2,
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
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(post.postImage),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.50),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {},
      // Get.to(() => PostDetailsPage(
      //   // post: post
      //   )), // Pass the post model
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Color(0xFFFFF7E7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 9.52,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userWidget(),
            postText(),
            InkWell(
              onTap: ()=>  Get.to(() => PostDetailsPage(
      //   // post: post
        )), 
              child: postContent()),
            SizedBox(height: 5),
            GetBuilder<PostLikeController>(
              init: PostLikeController(postId: post.postId),
              builder: (controller) {
                return WidgetPostCommentBar(postCounts: post.likesCount,postId: post.postId,);
              }
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

List texts = [
  '<@001> Taking a break from the usual hustle! Sometimes, you need to pause and enjoy the little things in life. A good book, a cup of coffee, and some time for yourself. #SelfCare #LifeBalance #Unwind',
  '#TravelDiaries Exploring a new city today, and it’s amazing! The architecture, the culture, and the people are all so unique. Can’t wait to share more moments from this trip! <@002> #Wanderlust #Adventure',
  '<@003> The mountains are calling, and I must go! There’s nothing like a breath of fresh air and a trail ahead. Nature has a way of healing our souls. #NatureLove #Hiking #Explore',
  '#FoodieJourney Trying out this new recipe today, and it smells incredible! There’s nothing like experimenting in the kitchen. <@004> Let’s see how it turns out! #HomeChef #Yummy',
  '#MusicVibes Music can truly change your mood. Listening to my favorite tracks right now and feeling all kinds of inspired. What’s your go-to song? <@005> #Playlist #FeelGood',
  'Sometimes, we just need to relax and enjoy the moment. <@006> Today is one of those days! Taking it easy and recharging. #ChillVibes #Relax #SundayFeels',
  '<@007> Life is better with friends by your side! Had an amazing day just laughing, sharing stories, and creating new memories. #FriendshipGoals #HappyTimes #Bonding',
  '#WorkoutRoutine Just finished my workout, and I feel incredible! Pushing myself each day to be a better version. What keeps you motivated? <@008> #FitnessLife #HealthyLiving',
  '<@009> Found the perfect place to watch the sunset today. The colors in the sky were breathtaking, and it reminded me of nature’s beauty. #SunsetLover #EveningMagic #NaturePhotography',
  '#BookLover A cozy evening with my favorite novel is all I need tonight. Sometimes, escaping into a story is the best way to unwind. <@010> #ReadingTime #PeacefulMoments',
  '<@011> Cooking is like therapy to me! Tried making a dish from scratch today, and it turned out pretty good. Who else loves spending time in the kitchen? #CookingJoy #Homemade #Tasty',
  '#PetLover My pet has a way of cheering me up no matter what. There’s nothing like the unconditional love of a furry friend. <@012> #PetsAreFamily #LoveMyPet #AnimalLover',
  'Every day is a new opportunity to learn something valuable. <@013> Whether it’s a small skill or a big lesson, keep learning and growing. #PersonalGrowth #KnowledgeIsPower',
  '#MorningMotivation Starting the day with a fresh mindset and lots of positivity! Today is going to be amazing, and I’m ready for it. What’s your morning routine? <@014> #PositiveVibes #NewDay',
  '<@015> Art has a way of letting us express our deepest feelings. Whether through painting, music, or writing, it’s a beautiful form of expression. #ArtisticSoul #CreativeLife #Inspiration',
  '#BeachDay Spent the day by the sea, soaking up the sun and feeling the waves. There’s nothing like a beach day to refresh your spirit. <@016> #OceanVibes #SandyToes #Relaxation',
  '<@017> Feeling grateful for all the amazing people in my life. Friends, family, and everyone who brings joy to my days. #GratefulHeart #Blessed #Thankful',
  '#NatureWalk Went on a little walk today and connected with nature. It’s amazing how calming a simple walk can be. Who else loves spending time outdoors? <@018> #NatureLover #Peace #FreshAir',
  '<@019> There’s no limit to what we can achieve if we believe in ourselves. Dream big, work hard, and stay determined. #DreamChaser #Ambition #NeverGiveUp',
  '#MovieNight Nothing like a good movie to end the day. Watching an all-time favorite with some popcorn. Who’s joining? <@020> #RelaxingEvening #CinemaLover #ChillTime',
];
