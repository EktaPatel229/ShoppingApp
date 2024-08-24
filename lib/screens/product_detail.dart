import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  final int initialCount;
  final int stepSize;
  const ProductDetails({
    super.key,
    required this.product,
    this.initialCount = 1,
    this.stepSize = 1,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late int _count;

  @override
  void initState() {
    _count = widget.initialCount;
    // fetch for similar products
    Future.microtask(() => Provider.of<ProductProvider>(context, listen: false)
        .fetchProducts(widget.product.category));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _increment(CartProvider cartProvider, Map<String, dynamic> product) {
    cartProvider.updateQuantity(product, _count + widget.stepSize);

    setState(() {
      _count += widget.stepSize;
    });
  }

  void _decrement(CartProvider cartProvider, Map<String, dynamic> product) {
    if (_count > widget.stepSize) {
      cartProvider.updateQuantity(product, _count - widget.stepSize);

      setState(() {
        _count -= widget.stepSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    // Fetch the count from CartProvider
    _count = cartProvider.getProductQuantity(widget.product.id) ?? 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppThemes.appTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppThemes.appTheme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppThemes.appTheme.colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.product.title.toUpperCase(),
            style: AppThemes.appTheme.textTheme.bodyLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 425,
                          width: MediaQuery.sizeOf(context)
                              .width, // Set the desired image height
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                              imageUrl: widget.product.image,
                              placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            widget.product.title,
                            style: AppThemes.appTheme.textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star_border_rounded,
                                color: AppThemes.appTheme.primaryColor,
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 0, 0),
                                child: Text(
                                  widget.product.rating.toString(),
                                  style: AppThemes.appTheme.textTheme.bodySmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 0, 0),
                                child: Text(
                                  '(${widget.product.ratingCount.toString()})',
                                  style: AppThemes.appTheme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MRP  ₹${widget.product.price.toStringAsFixed(2)}',
                                style: AppThemes.appTheme.textTheme.bodyMedium,
                              ),
                              Container(
                                width: 116,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xFFE0E3E7),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: _count > widget.stepSize
                                            ? Color(0xFF57636C)
                                            : Color(0xFFE0E3E7),
                                        size: 20,
                                      ),
                                      onPressed: _count > widget.stepSize
                                          ? () {
                                              List<Map<String, dynamic>>
                                                  _cartItems = [];
                                              _cartItems.add({
                                                'productId': widget.product.id,
                                                'quantity': 1,
                                                'productName':
                                                    widget.product.title,
                                                'price': widget.product.price,
                                                'image': widget.product.image,
                                                // Add other fields if needed
                                              });
                                              _decrement(
                                                  cartProvider, _cartItems[0]);
                                            }
                                          : null,
                                    ),
                                    Text(
                                      _count.toString(),
                                      style: AppThemes
                                          .appTheme.textTheme.bodySmall,
                                    ),
                                    IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          color: Color(0xFF0F1113),
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          List<Map<String, dynamic>>
                                              _cartItems = [];
                                          _cartItems.add({
                                            'productId': widget.product.id,
                                            'quantity': 1,
                                            'productName': widget.product.title,
                                            'price': widget.product.price,
                                            'image': widget.product.image,
                                            // Add other fields if needed
                                          });
                                          _increment(
                                              cartProvider, _cartItems[0]);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Text(
                            widget.product.description,
                            style: AppThemes.appTheme.textTheme.displayMedium,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            'SIMILAR PRODUCTS',
                            style: AppThemes.appTheme.textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppThemes.appTheme.scaffoldBackgroundColor,
                          ),
                          child: Consumer<ProductProvider>(
                            builder: (context, productProvider, child) {
                              if (productProvider.isLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (productProvider.products.isEmpty) {
                                return const Center(
                                    child: Text("No products found"));
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      productProvider.products.map((product) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Color(
                                                0xFFE0E3E7), // Set the border color as per your design
                                            width: 1, // Set the border width
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            product.image,
                                            width: 150,
                                            height: 180,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
