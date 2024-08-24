import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/checkout.dart';
import '../providers/cart_provider.dart';
import '../themes/app_themes.dart';

class MyCart extends StatefulWidget {
  final int initialCount;
  final int stepSize;

  const MyCart({
    super.key,
    this.initialCount = 1,
    this.stepSize = 1,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late int _count;

  @override
  void initState() {
    _count = widget.initialCount;
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
            'SHOPPING BAG',
            style: AppThemes.appTheme.textTheme.bodyLarge,
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.cartItems[index];
                        final productId = item['productId'];
                        final quantity = item['quantity'];
                        final name = item['productName'];
                        final price = item['price'];
                        final image = item['image'];

                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppThemes.appTheme.scaffoldBackgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: 'ControllerImage$productId',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        image,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 8),
                                            child: Text(
                                              name,
                                              style: AppThemes
                                                  .appTheme.textTheme.bodyLarge,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            '\₹${price.toStringAsFixed(2)}',
                                            style: AppThemes
                                                .appTheme.textTheme.bodyMedium,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            width: 116,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFE0E3E7),
                                                width: 2,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: quantity > 1
                                                        ? Color(0xFF57636C)
                                                        : Color(0xFFE0E3E7),
                                                    size: 20,
                                                  ),
                                                  onPressed: quantity > 1
                                                      ? () {
                                                          _count = quantity;
                                                          _decrement(
                                                              cartProvider,
                                                              item);
                                                        }
                                                      : null,
                                                ),
                                                Text(
                                                  quantity.toString(),
                                                  style: AppThemes.appTheme
                                                      .textTheme.bodySmall,
                                                ),
                                                IconButton(
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: Color(0xFF0F1113),
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      _count = quantity;
                                                      _increment(
                                                          cartProvider, item);
                                                    }),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: Color(0xFFDE4C62),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      cartProvider.removeFromCart(productId);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildPriceBreakdown(context),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16), // Top and Bottom padding
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.5, // Half of the device width
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Checkout(),
                              ),
                            );
                          },
                          child: Text(
                            "Checkout",
                            style: AppThemes.appTheme.textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPriceBreakdown(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        double totalPrice = cartProvider.getTotalPrice();
        double taxes = totalPrice * 0.1025; // Assuming 10.25% tax
        double finalPrice = totalPrice + taxes;

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'PRICE DETAILS',
                      style: AppThemes.appTheme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total MRP',
                      style: AppThemes.appTheme.textTheme.displayMedium,
                    ),
                    Text(
                      '₹${totalPrice.toStringAsFixed(2)}',
                      style: AppThemes.appTheme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taxes(10.25%)',
                      style: AppThemes.appTheme.textTheme.displayMedium,
                    ),
                    Text(
                      '₹${taxes.toStringAsFixed(2)}',
                      style: AppThemes.appTheme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Platform Fee',
                      style: AppThemes.appTheme.textTheme.displayMedium,
                    ),
                    Text(
                      'FREE',
                      style: AppThemes.appTheme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Fee',
                      style: AppThemes.appTheme.textTheme.displayMedium,
                    ),
                    Text(
                      'FREE',
                      style: AppThemes.appTheme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Total Amount',
                          style: AppThemes.appTheme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    Text(
                      '₹${finalPrice.toStringAsFixed(2)}',
                      style: AppThemes.appTheme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
