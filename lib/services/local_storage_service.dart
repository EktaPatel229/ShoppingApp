import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveCartData(List<Map<String, dynamic>> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(cartItems);
    await prefs.setString('cart_items', jsonString);
  }

  static Future<List<Map<String, dynamic>>> getCartData() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('cart_items');
    if (jsonString != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(jsonString));
    }
    return [];
  }
}
