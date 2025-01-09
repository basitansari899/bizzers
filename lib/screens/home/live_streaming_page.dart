import 'dart:math';

import 'package:bizconnect/widgets/home/home_stories_widget.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:faker_dart/faker_dart.dart';

import '../../utils/exports.dart';

class LiveStreamingPage extends StatefulWidget {
  const LiveStreamingPage({super.key});
  @override
  State<LiveStreamingPage> createState() => _LiveStreamingPageState();
}

class _LiveStreamingPageState extends State<LiveStreamingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                HomeStoriesWidget(color: Colors.white,),
                Stack(
                  children: [
                    Image.network(
                      Faker.instance.image.image(width: (600),height: 900),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 20,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Following", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                          Text("Live", style: TextStyle(color: Colors.white)),
                          Text("Clips", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
            for(int c= 0;c<imageUrls.length;c++)
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        Faker.instance.image.image(width: (800+c).toInt(),height: 1200+c),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Top tabs
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Following", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                          Text("Live", style: TextStyle(color: Colors.white)),
                          Text("Clips", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    // Right-side icons
                    Positioned(
                      right: 10,
                      bottom: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                                child: Icon(Icons.add, color: Colors.white, size: 10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(BootstrapIcons.heart_fill, color: Colors.white, size: 28),
                          SizedBox(height: 6),
                          Text("1.3M", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 20),
                          Icon(BootstrapIcons.chat_dots, color: Colors.white, size: 28),
                          SizedBox(height: 6),
                          Text("10.7M", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 20),
                          Icon(Icons.share, color: Colors.white, size: 28),
                          SizedBox(height: 6),
                          Text("30.9K", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    // Bottom user info
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          Icon(Icons.monetization_on, color: Colors.yellow),
                          SizedBox(width: 8),
                          Text("1.3M", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10),
                          Text("@arianzesan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final List<String> imageUrls = [
  'https://images.unsplash.com/photo-1513708922410-d7f28be0b6a8?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1526672477135-e513176f20b5?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1515091943-9f19f6a6ff10?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1524503033411-c9566986fc8f?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1542300058-e9a43499d2d2?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1544717301-9cdcb1f594e0?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1519682577862-22b62b24e493?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1523229720128-bd3341b63e31?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1518893883803-06e425a5a44d?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1502767089025-6572583495b3?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?fit=crop&w=800&h=1200',
  'https://images.unsplash.com/photo-1543895085-fa07a98d237f?fit=crop&w=800&h=1200',
];
