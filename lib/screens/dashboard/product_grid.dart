import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/product_detail.dart';
import 'package:shopping/themes/app_themes.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final bool isLoading; // Add this to control shimmer effect

  const ProductGrid({Key? key, required this.products, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemes
          .appTheme.scaffoldBackgroundColor, // Set background color to white
      child: isLoading
          ? _buildShimmerEffect() // Show shimmer effect while loading
          : GridView.builder(
              padding: const EdgeInsets.all(4.0),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) => ProductItem(product: products[i]),
            ),
    );
  }

  Widget _buildShimmerEffect() {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 10, // Adjust the number of shimmer items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.fitHeight,
                            width: double.infinity,
                            // height: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Text(
                      product.title,
                      style: AppThemes.appTheme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\₹${product.price.toStringAsFixed(2)}",
                          style: AppThemes.appTheme.textTheme.bodySmall,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            size: 14,
                            color: AppThemes.appTheme
                                .primaryColor, // Set the color of the icon here
                          ),
                          onPressed: () {
                            context.read<CartProvider>().addToCart(product);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
