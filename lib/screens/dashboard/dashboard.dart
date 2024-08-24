import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/category_provider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/screens/cart.dart';
import 'package:shopping/screens/dashboard/product_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping/themes/app_themes.dart';
import 'package:badges/badges.dart' as badges;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> imageList = [
    'assets/images/shopping.jpeg',
    'assets/images/clothes.png',
    'assets/images/beg.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    if (categoryProvider.categories.isNotEmpty) {
      _tabController = TabController(
        length: categoryProvider.categories.length,
        vsync: this,
      );

      // Update the tab controller to the first tab
      _tabController.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: Text(
                      "Shopping",
                      style: AppThemes.appTheme.textTheme.headlineLarge,
                    ),
                    pinned: true,
                    expandedHeight: 100,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(48.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: Colors.black38,
                          labelColor: Theme.of(context).primaryColor,
                          indicatorColor: Theme.of(context).primaryColor,
                          tabs: categoryProvider.categories
                              .map((category) => Tab(text: category.name))
                              .toList(),
                          onTap: (index) {
                            // click on category, load products by category
                            final selectedCategory =
                                categoryProvider.categories[index];
                            productProvider
                                .fetchProducts(selectedCategory.name);
                            setState(() {
                              _tabController.animateTo(index);
                            });
                          },
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: badges.Badge(
                            badgeContent: Text(
                              context
                                  .watch<CartProvider>()
                                  .getTotalCartItems()
                                  .toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            position:
                                badges.BadgePosition.topEnd(top: -5, end: -1),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyCart(),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: AppThemes.appTheme.scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CarouselSlider.builder(
                        itemCount: imageList.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return SizedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                imageList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          reverse: false,
                          disableCenter: true,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          viewportFraction: 0.9,
                          pageSnapping: true,
                          aspectRatio: 2,
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: ProductGrid(
                products: productProvider.products,
                isLoading: productProvider.isLoading,
              ),
            );
          },
        );
      },
    );
  }
}
