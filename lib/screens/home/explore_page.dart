import 'package:bizconnect/models/products_model.dart';
import 'package:bizconnect/screens/home/controllers/explore_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';
import '../../widgets/products/single_gride_product_widget.dart';
import '../../widgets/products/single_list_product_widget.dart';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

class ExplorePage extends GetView<ExploreController>  {
   const ExplorePage({super.key});
  // String select = "T-Shirts";
  // bool list = true;
  // final List<Map<String, String>> categories = [
  //   {
  //     "name": "T-Shirts",
  //     "icon": "https://via.placeholder.com/50",
  //     // replace with an actual icon URL
  //   },
  //   {
  //     "name": "Accessories",
  //     "icon": "https://via.placeholder.com/50",
  //     // replace with an actual icon URL
  //   },
  //   {
  //     "name": "Gaming",
  //     "icon": "https://via.placeholder.com/50",
  //     // replace with an actual icon URL
  //   },
  //   {
  //     "name": "Cars",
  //     "icon": "https://via.placeholder.com/50",
  //     // replace with an actual icon URL
  //   },
  //   {
  //     "name": "Bakery",
  //     "icon": "https://via.placeholder.com/50",
  //     // replace with an actual icon URL
  //   },
  //   {
  //     "name": "Electronics",
  //     "icon": "https://via.placeholder.com/50", // new category
  //   },
  //   {
  //     "name": "Shoes",
  //     "icon": "https://via.placeholder.com/50", // new category
  //   },
  //   {
  //     "name": "Sports",
  //     "icon": "https://via.placeholder.com/50", // new category
  //   },
  //   {
  //     "name": "Home Decor",
  //     "icon": "https://via.placeholder.com/50", // new category
  //   },
  //   {
  //     "name": "Books",
  //     "icon": "https://via.placeholder.com/50", // new category
  //   }
  // ];

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
        Obx(()=>
           Container(
            padding: EdgeInsets.all(10),
            height: 45,
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: controller.categoriesStream.value,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
          
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No categories available"));
                }
          
                final categories = snapshot.data!;
          
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories.map((item) {
                    return GestureDetector(
                      onTap: () {
                        controller.updateSelectedCategory(item['id'] ?? '');
                      },
                      child: Obx(() {
                        final isSelected = controller.selectedCategory.value == item['id'];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            item['name'] ?? '',
                            style: GoogleFonts.manrope(
                              color: isSelected ? primaryColor : Color(0xFF6C6C6C),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.32,
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

    return Scaffold(
      body: 
      SafeArea(
        child: Column(
            children: [
        // Always visible widget at the top
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
        topWidget(),  // Your additional widget that should be shown above the product list
        
        // StreamBuilder for the product list
        StreamBuilder<List<ProductModel>>(
            stream: controller.getProducts(), // The stream that will provide the list of products
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading spinner while waiting for data
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Display error message if the stream encounters an error
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // Show message if no data is available
                return Center(child: Text('No products available.'));
              }
        
              // Extract the list of products from the snapshot data
              var productsList = snapshot.data!;
        
              return Obx(()=>
                ListView(
                  shrinkWrap: true,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Find, Shop & Enjoy',
                    //       style: GoogleFonts.manrope(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w500,
                    //         letterSpacing: 0.44,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.list.value = !controller.list.value;
                          },
                          child: Icon(
                            controller.list.value
                                ? BootstrapIcons.grid_3x3_gap_fill
                                : BootstrapIcons.list_stars,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (controller.list.value)
                      for (var product in productsList)
                        SingleListProductWidget(product: product),
                    if (!controller.list.value)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: productsList.length,
                          itemBuilder: (context, index) =>
                              SingleGridProductWidget(product: productsList[index]),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        
            ],
          ),
      ),
        //  ListView(
        //   shrinkWrap: true,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Find, Shop & Enjoy',
        //           style: GoogleFonts.manrope(
        //             fontSize: 22,
        //             fontWeight: FontWeight.w500,
        //             letterSpacing: 0.44,
        //           ),
        //         ),
        //       ],
        //     ),
        //     topWidget(),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         InkWell(
        //           onTap: () {
                    
        //             controller.list.value = !controller.list.value;
        //           },
        //           child: Icon(
        //             controller.list.value
        //                 ? BootstrapIcons.grid_3x3_gap_fill
        //                 : BootstrapIcons.list_stars,
        //             color: primaryColor,
        //           ),
        //         ),
        //         SizedBox(width: 16),
        //       ],
        //     ),
        //     SizedBox(height: 10),
        //     if (controller.list.value)
        //       for (var i = 0; i < productsList.length; i++)
        //         SingleListProductWidget(
        //           product: productsList[i],
        //         ),
        //     if (!controller.list.value)
        //       Container(
        //         margin: EdgeInsets.symmetric(horizontal: 16),
        //         child: GridView.builder(
        //           shrinkWrap: true,
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2, // Number of items per row
        //             mainAxisSpacing: 8,
        //             crossAxisSpacing: 8,
        //             childAspectRatio: 0.7, // Adjust as needed for layout
        //           ),
        //           itemCount: productsList.length, // Total number of products
        //           itemBuilder: (context, index) => SingleGridProductWidget(
        //             product: productsList[index],
        //           ),
        //         ),
        //       ),
        //   ],
        // ),
      
    );
  }
}
