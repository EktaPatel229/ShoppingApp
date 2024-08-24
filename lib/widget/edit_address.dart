import 'package:flutter/material.dart';
import 'package:shopping/themes/app_themes.dart';

class EditAddressWidget extends StatefulWidget {
  const EditAddressWidget({
    super.key,
    required this.name,
    required this.address,
    this.phone,
  });

  final String? name;
  final String? address;
  final String? phone;

  @override
  State<EditAddressWidget> createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState extends State<EditAddressWidget> {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneNumberController;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    addressController = TextEditingController(text: widget.address);
    phoneNumberController = TextEditingController(text: widget.phone);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                    'EDIT ADDRESS',
                    textAlign: TextAlign.center,
                    style: AppThemes.appTheme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Name',
                            textAlign: TextAlign.center,
                            style: AppThemes.appTheme.textTheme.bodyMedium,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: nameController,
                              style: AppThemes.appTheme.textTheme.bodyMedium,
                              decoration: const InputDecoration(
                                hintText: '', // Placeholder text
                                border: InputBorder
                                    .none, // Removes the default TextField border
                              ),
                              onChanged: (value) {
                                // Handle changes in the text field if needed
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Delivery Address',
                            textAlign: TextAlign.center,
                            style: AppThemes.appTheme.textTheme.bodyMedium,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: addressController,
                              style: AppThemes.appTheme.textTheme.bodyMedium,
                              decoration: const InputDecoration(
                                hintText: '', // Placeholder text
                                border: InputBorder
                                    .none, // Removes the default TextField border
                              ),
                              onChanged: (value) {
                                // Handle changes in the text field if needed
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Phone Number',
                            textAlign: TextAlign.center,
                            style: AppThemes.appTheme.textTheme.bodyMedium,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: phoneNumberController,
                              style: AppThemes.appTheme.textTheme.bodyMedium,
                              decoration: const InputDecoration(
                                hintText: '', // Placeholder text
                                border: InputBorder
                                    .none, // Removes the default TextField border
                              ),
                              onChanged: (value) {
                                // Handle changes in the text field if needed
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: AppThemes.appTheme.textTheme.displayLarge,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save",
                            style: AppThemes.appTheme.textTheme.displayLarge,
                          ),
                        ),
                      ),
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
}
