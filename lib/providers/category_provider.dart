import 'package:flutter/material.dart';
import 'package:shopping/model/category.dart';
import '../services/api_service.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = true;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  CategoryProvider() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      _categories = await ApiService().fetchCategories();
    } catch (error) {
      // Handle error here
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
