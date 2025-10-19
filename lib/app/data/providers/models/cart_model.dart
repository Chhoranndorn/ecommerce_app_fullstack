import 'package:get/get.dart';

// Model class for a Cart Item
class CartItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  RxInt quantity; // Reactive quantity

  CartItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    int initialQuantity = 1,
  }) : quantity = initialQuantity.obs;
}
