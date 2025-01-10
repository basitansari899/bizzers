import 'package:bizconnect/models/products_model.dart';
import 'package:bizconnect/res/mixin_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController with LoadingMixin{

  RxBool list = false.obs;
  // Stream of categories
  final categoriesStream = FirebaseFirestore.instance
      .collection('product_categories')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'name': doc['name'] ?? '',
          };
        }).toList();
      }).obs;

  // Selected category name
  final selectedCategory = ''.obs;

  // Update selected category
  void updateSelectedCategory(String name) {
    selectedCategory.value = name;
  }

   var productsList = <ProductModel>[].obs;

  // Stream to get products from Firebase
  Stream<List<ProductModel>> getProducts() {
    return FirebaseFirestore.instance
        .collection('products') // Adjust to the correct path
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }

  // Method to fetch the products initially
  void fetchProducts() {
    getProducts();
  }

}