import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Model/product.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/category_provider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/screens/splash.dart';
import 'package:shopping/themes/app_themes.dart';
import 'Model/category.dart';

List<Product> favouriteList = [];
List<Product> mainProductList = [];
List<Category> categoryList = [];

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(
          create: (context) => CartProvider()..loadCartData(),
        ),
      ],
      child: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      initialRoute: '/ShoppingApp',
      routes: {'/ShoppingApp': (context) => const Splash()},
    );
  }
}
