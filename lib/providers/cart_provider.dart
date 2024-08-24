import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';
import '../services/local_storage_service.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int getTotalCartItems() {
    int totalItems = 0;
    for (var item in _cartItems) {
      int quantity = (item['quantity'] as num?)?.toInt() ?? 0;
      totalItems += quantity;
    }
    return totalItems;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      double price = (item['price'] as num?)?.toDouble() ?? 0.0;
      int quantity = (item['quantity'] as num?)?.toInt() ?? 0;
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  void addToCart(Product product) {
    int index =
        _cartItems.indexWhere((item) => item['productId'] == product.id);
    if (index >= 0) {
      _cartItems[index]['quantity'] +=
          1; // Assuming you want to increase quantity by 1
    } else {
      _cartItems.add({
        'productId': product.id,
        'quantity': 1,
        'productName': product.title,
        'price': product.price,
        'image': product.image,
        // Add other fields if needed
      });
    }
    notifyListeners();
    LocalStorageService.saveCartData(_cartItems);
  }

  void updateQuantity(Map<String, dynamic> product, int quantity) {
    int index = _cartItems
        .indexWhere((item) => item['productId'] == product['productId']);

    if (index >= 0) {
      // Update the existing quantity if the product is already in the cart
      _cartItems[index]['quantity'] = quantity;
    } else if (quantity > 0) {
      _cartItems.add({
        'productId': product['productId'],
        'quantity': quantity,
        'productName': product['productName'],
        'price': product['price'],
        'image': product['image'],
        // Add other fields if needed
      });
    }

    notifyListeners();
    LocalStorageService.saveCartData(_cartItems);
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item['productId'] == productId);
    notifyListeners();
    LocalStorageService.saveCartData(_cartItems);
  }

  int getProductQuantity(int productId) {
    int index = _cartItems.indexWhere((item) => item['productId'] == productId);
    if (index >= 0) {
      return _cartItems[index]['quantity'] as int;
    }
    return 0; // Return 0 if the product is not in the cart
  }

  Future<void> loadCartData() async {
    _cartItems = await LocalStorageService.getCartData();
    notifyListeners();
  }
}
