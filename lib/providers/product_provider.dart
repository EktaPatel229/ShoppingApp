import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts(String category) async {
    try {
      _isLoading = true;
      _products = await ApiService().fetchProductsByCategory(category);
    } catch (error) {
      print("Error fetching products: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
