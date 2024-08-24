import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping/model/category.dart';
import 'package:shopping/model/product.dart';

class ApiService {
  static const String baseUrl = "https://fakestoreapi.com/";

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}products/categories'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response =
        await http.get(Uri.parse('${baseUrl}products/category/$category'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
