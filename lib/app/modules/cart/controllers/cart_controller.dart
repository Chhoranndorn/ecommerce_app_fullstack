import 'package:e_commerce_app/app/data/providers/models/cart_model.dart';
import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[
    CartItem(
      id: '1',
      title: 'item_1_title',
      description: 'item_1_desc',
      price: 10.00,
      image: Images.product1, // Replace with your asset
      initialQuantity: 1,
    ),
    CartItem(
      id: '2',
      title: 'item_2_title',
      description: 'item_2_desc',
      price: 3.00,
      image: Images.product2, // Replace with your asset
      initialQuantity: 1,
    ),
    CartItem(
      id: '3',
      title: 'item_3_title',
      description: 'item_3_desc',
      price: 1.00,
      image: Images.product3, // Replace with your asset
      initialQuantity: 1,
    ),
  ].obs;

  // --- Getters ---

  // Calculate the total price reactively
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item.price * item.quantity.value));

  // --- Methods ---

  void incrementItem(int index) {
    cartItems[index].quantity.value++;
    // Force update the list to recalculate total
    cartItems.refresh();
  }

  void decrementItem(int index) {
    if (cartItems[index].quantity.value > 1) {
      cartItems[index].quantity.value--;
      cartItems.refresh();
    } else {
      // Optional: show a confirmation dialog before removing
      removeItem(index);
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    // You might want to show a Get.snackbar here
  }

  void continueShopping() {
    // Navigate back to the main shopping/dashboard page
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void checkout() {
    // Navigate to the checkout or payment screen
    // Get.snackbar('Checkout', 'Navigating to payment...');
    Get.toNamed(Routes.CHECKOUT);
    // Example: Get.toNamed(Routes.CHECKOUT);
  }
}
