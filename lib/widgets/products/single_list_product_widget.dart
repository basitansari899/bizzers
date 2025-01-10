import 'dart:math';

import 'package:bizconnect/models/products_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/globals/product_details_page.dart';
import '../../utils/exports.dart';
import '../global/show_rating_widget.dart';

class SingleListProductWidget extends StatelessWidget {
  final ProductModel product;
  const SingleListProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ProductDetailsPage(product: product)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 368.92,
        height: 111.86,
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
        child: Row(
          children: [
            _productImage(),
            Expanded(child: _productDetails()),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.6),
        bottomLeft: Radius.circular(8.6),
      ),
      child: Image.network(
        product.images.first,
        width: 111.86,
        height: 111.86,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
              color: Color(0xFF212121),
              fontSize: 17.21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            product.brand,
            style: GoogleFonts.manrope(
              color: Color(0xFF9B9B9B),
              fontSize: 11.83,
              fontWeight: FontWeight.normal,
            ),
          ),
          RatingNoPoints(ratingCount: Random().nextInt(5)),
          Text(
            "\$${product.price}",
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

