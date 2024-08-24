import 'package:provider/provider.dart';
import 'package:shopping/widget/payment.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widget/edit_address.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                      'Taxes',
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
            'CHECK OUT',
            style: AppThemes.appTheme.textTheme.bodyLarge,
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppThemes.appTheme.scaffoldBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 16, 24, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'PAYMENT METHOD',
                                style: AppThemes.appTheme.textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Google Pay',
                                            style: AppThemes.appTheme.textTheme
                                                .displayMedium,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: Color(0xFFD9D9D9),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(5, 7, 5, 7),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'assets/images/gpay.png',
                                                      width: 25,
                                                      height: 11,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'csmith@gmail.com',
                                                style: AppThemes.appTheme
                                                    .textTheme.displayMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 6),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(24)),
                                          ),
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              const PaymentWidget(),
                                        );
                                      },
                                      child: Text(
                                        'Change',
                                        style: AppThemes
                                            .appTheme.textTheme.headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppThemes.appTheme.scaffoldBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 16, 24, 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'DELIVERY ADDRESS',
                                style: AppThemes.appTheme.textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Charlie Smith',
                                            style: AppThemes.appTheme.textTheme
                                                .displayMedium,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '1 Queens Rd, Melbourne, VIC 3000',
                                            style: AppThemes.appTheme.textTheme
                                                .displayMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 6),
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(24)),
                                          ),
                                          isScrollControlled: true,
                                          enableDrag: false,
                                          builder: (context) =>
                                              const EditAddressWidget(
                                            name:
                                                "Charlie Smith", // Pass the required parameters here
                                            address:
                                                '1 Queens Rd, Melbourne, VIC 3000',
                                            phone: '9876543210',
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Change',
                                        style: AppThemes
                                            .appTheme.textTheme.headlineSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildPriceBreakdown(context),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16), // Top and Bottom padding
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Half of the device width
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Complete Purchase",
                        style: AppThemes.appTheme.textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
