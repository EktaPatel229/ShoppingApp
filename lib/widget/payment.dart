import 'package:flutter/material.dart';
import 'package:shopping/themes/app_themes.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({
    super.key,
  });

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  TextEditingController upiController = TextEditingController();

  int selectedIndex = 0;
  int valueChange = 0;

  onSelected(int index) {
    setState(() => selectedIndex = index);
  }

  final List<String> upiArray = ['Paytm', 'Gpay', 'Phonepe'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: AppThemes.appTheme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppThemes.appTheme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 34, 0, 34),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'PAYMENT METHOD',
                    textAlign: TextAlign.center,
                    style: AppThemes.appTheme.textTheme.bodyLarge,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: SizedBox(
                                height: 25,
                                child: Image.asset("assets/images/bheem.png",
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                            onTap: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              " Add UPI ID",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppThemes.appTheme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 1,
                                        ),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 13, right: 8),
                                      child: TextFormField(
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        controller: upiController,
                                        decoration: InputDecoration(
                                          labelStyle: AppThemes
                                              .appTheme.textTheme.bodyMedium,
                                          hintText: 'Enter Your UPI ID',
                                          hintStyle: AppThemes
                                              .appTheme
                                              .textTheme
                                              .bodyMedium, // Placeholder text
                                          border: InputBorder
                                              .none, // Removes the default TextField border
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 66,
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Verify",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listofUPI(upiArray),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listofUPI(List<String> upiList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Text(
            "Your saved UPI ID",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppThemes.appTheme.textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: upiList.length,
            itemBuilder: (context, i) {
              bool isSelected = i == valueChange;
              return InkWell(
                enableFeedback: true,
                onTap: () {
                  setState(() {
                    valueChange = i;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: i,
                            groupValue: valueChange,
                            onChanged: (value) {
                              setState(() {
                                valueChange = value as int;
                                print(value);
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                upiList[i],
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppThemes.appTheme.textTheme.headlineMedium,
                              ),
                              Text(
                                "1947 xxxx xxxx 3425",
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppThemes.appTheme.textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (isSelected)
                        Image(
                          image: AssetImage(
                              "assets/images/${upiArray[i].toLowerCase()}.png"),
                          width: 55,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
