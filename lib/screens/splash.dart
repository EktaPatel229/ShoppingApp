import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/category_provider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/screens/dashboard/dashboard.dart';
import 'package:shopping/themes/app_themes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Fetch categories and products
    _loadData();
  }

  Future<void> _loadData() async {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    await categoryProvider.fetchCategories();
    if (categoryProvider.categories.isNotEmpty) {
      await productProvider.fetchProducts(categoryProvider.categories[0].name);
    }

    // After data is loaded, navigate to the Dashboard page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppThemes.appTheme.scaffoldBackgroundColor,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 0.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                  child: Text(
                    'Get ready for hottest style',
                    style: AppThemes.appTheme.textTheme.labelSmall,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppThemes.appTheme.primaryColor,
                    strokeWidth: 2,
                  ),
                ),
                // Loading indicator
              ],
            ),
          ],
        ),
      ),
    );
  }
}
