import 'dart:math';

import 'package:bizconnect/models/products_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/globals/product_details_page.dart';
import '../../utils/exports.dart';
import '../global/show_rating_widget.dart';

class SingleGridProductWidget extends StatefulWidget {
  final ProductModel product;
  const SingleGridProductWidget({super.key, required this.product});

  @override
  State<SingleGridProductWidget> createState() => _SingleGridProductWidgetState();
}

class _SingleGridProductWidgetState extends State<SingleGridProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ProductDetailsPage(product: widget.product)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.6),
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 26.89,
              offset: Offset(0, 1.08),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage(),
            Expanded(child: _productDetails()),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    final randomWidthOffset = Random().nextInt(20) - 10;
    final width = 225 + randomWidthOffset;
    final height = width * 4 ~/ 3;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.6),
        topRight: Radius.circular(8.6),
      ),
      child: Image.network(
        Faker.instance.image.image(width: width, height: height),
        width: double.infinity,
        height: 160,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _productDetails() {
    final v = Random().nextInt(5);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Faker.instance.commerce.productName(),
            style: GoogleFonts.manrope(
              color: Color(0xFF212121),
              fontSize: 17.21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Dorothy Perkins',
            style: GoogleFonts.manrope(
              color: Color(0xFF9B9B9B),
              fontSize: 11.83,
              fontWeight: FontWeight.normal,
            ),
          ),
          RatingNoPoints(ratingCount: v),
          Text(
            Faker.instance.commerce.price(max: 50),
            style: GoogleFonts.manrope(
              color: Color(0xFF212121),
              fontSize: 15.06,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}