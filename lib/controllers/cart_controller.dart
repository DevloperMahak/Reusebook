import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/book.dart';

class CartController extends GetxController {
  final _box = GetStorage();
  var cartItems = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCartFromStorage();
  }

  void addToCart(Book book) {
    cartItems.add(book);
    _saveCartToStorage(); // Save updated cart
  }

  void removeFromCart(Book book) {
    cartItems.remove(book);
    _saveCartToStorage();
  }

  void clearCart() {
    cartItems.clear();
    _saveCartToStorage(); // Also update storage after clearing
  }
    void _saveCartToStorage() {
      final cartJson = cartItems.map((book) => book.toJson()).toList();
      _box.write('cart', cartJson);
    }

    void _loadCartFromStorage() {
      final savedCart = _box.read('cart');
      if (savedCart != null) {
        cartItems.value =
        List<Book>.from(savedCart.map((json) => Book.fromJson(json)));
      }
  }
}
