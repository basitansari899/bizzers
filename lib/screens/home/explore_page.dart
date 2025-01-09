import 'package:bizconnect/models/products_model.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';
import '../../widgets/products/single_gride_product_widget.dart';
import '../../widgets/products/single_list_product_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String select = "T-Shirts";
  bool list = true;
  final List<Map<String, String>> categories = [
    {
      "name": "T-Shirts",
      "icon": "https://via.placeholder.com/50",
      // replace with an actual icon URL
    },
    {
      "name": "Accessories",
      "icon": "https://via.placeholder.com/50",
      // replace with an actual icon URL
    },
    {
      "name": "Gaming",
      "icon": "https://via.placeholder.com/50",
      // replace with an actual icon URL
    },
    {
      "name": "Cars",
      "icon": "https://via.placeholder.com/50",
      // replace with an actual icon URL
    },
    {
      "name": "Bakery",
      "icon": "https://via.placeholder.com/50",
      // replace with an actual icon URL
    },
    {
      "name": "Electronics",
      "icon": "https://via.placeholder.com/50", // new category
    },
    {
      "name": "Shoes",
      "icon": "https://via.placeholder.com/50", // new category
    },
    {
      "name": "Sports",
      "icon": "https://via.placeholder.com/50", // new category
    },
    {
      "name": "Home Decor",
      "icon": "https://via.placeholder.com/50", // new category
    },
    {
      "name": "Books",
      "icon": "https://via.placeholder.com/50", // new category
    }
  ];

  @override
  Widget build(BuildContext context) {
    Widget searchField() {
      return Container(
        width: Get.width,
        height: 49,
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search Here',
              hintStyle: TextStyle(
                fontSize: 15.14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.15,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF484848).withOpacity(0.5),
                size: 24,
              )),
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: 15.14,
          ),
        ),
      );
    }

    Widget topWidget() {
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 26),
            searchField(),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(10),
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((item) {
                  bool selected = select == item["name"];
                  return GestureDetector(
                    onTap: () {
                      select = item["name"] ?? "";
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        item["name"] ?? "",
                        style: GoogleFonts.manrope(
                          color: selected ? primaryColor : Color(0xFF6C6C6C),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Find, Shop & Enjoy',
                style: GoogleFonts.manrope(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.44,
                ),
              ),
            ],
          ),
          topWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    list = !list;
                  });
                },
                child: Icon(
                  list
                      ? BootstrapIcons.grid_3x3_gap_fill
                      : BootstrapIcons.list_stars,
                  color: primaryColor,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 10),
          if (list)
            for (var i = 0; i < productsList.length; i++)
              SingleListProductWidget(
                product: productsList[i],
              ),
          if (!list)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7, // Adjust as needed for layout
                ),
                itemCount: productsList.length, // Total number of products
                itemBuilder: (context, index) => SingleGridProductWidget(
                  product: productsList[index],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
