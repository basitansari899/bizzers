import 'package:bizconnect/models/products_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/comment_model.dart';
import '../../utils/exports.dart';
import '../../widgets/global/add_comment_widget.dart';
import '../../widgets/global/comment_widget.dart';
import '../store/cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductDetailsLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = ProductDetailsLogic(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildImageCarousel(),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _logic.product.title,
              style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '\$${_logic.product.price}',
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$39',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text('5 Rating'),
                const SizedBox(width: 8),
                Text('44 Sold'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 110.73,
                      alignment: Alignment.center,
                      height: 35.87,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFFDAA30A), Color(0xFFD3A921), Color(0xFFD2A623)],
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 110.73,
                      height: 35.87,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: primaryColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text('Add to Cart',
                          style: GoogleFonts.manrope(
                            color: primaryColor,
                          ))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select Size',
              style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Container(padding: EdgeInsets.symmetric(horizontal: 16), child: _buildSizeOptions()),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select Colors',
              style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _buildColorOptions(),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Description',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(_logic.product.description),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AddCommentWidget(),
          ),
          SizedBox(
            height: 14,
          ),
          for (var c in comments)
            Column(
              children: [
                CommentWidget(comment: c),
                Divider(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 400,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            widget.product.images.first,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _logic.product.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(_logic.product.images[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              top: 40,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
                  IconButton(onPressed: () => Get.to(() => CartPage()), icon: Icon(Icons.shopping_cart)),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildSizeOptions() {
    return Row(
      children: _logic.sizes.map((size) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ChoiceChip(
            label: Text(size),
            selectedColor: primaryColor,
            selected: _logic.selectedSize == size,
            onSelected: (isSelected) {
              setState(() {
                _logic.selectedSize = size;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorOptions() {
    return Row(
      children: _logic.colors.map((color) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _logic.selectedColor = color;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: _logic.selectedColor == color ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
            width: 30,
            height: 30,
          ),
        );
      }).toList(),
    );
  }
}

class ProductDetailsLogic {
  final ProductModel product;
  String selectedSize = 'M';
  Color selectedColor = Colors.purple;

  List<String> get sizes => ['XS', 'S', 'M', 'L', 'XL'];

  List<Color> get colors => [Colors.purple, Colors.red, Colors.yellow, Colors.blue, Colors.black];

  ProductDetailsLogic(this.product);
}
