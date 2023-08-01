import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? textController = TextEditingController();
  final String hintText;
  String? Function(String?)? validator;
  final bool obscureText;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.textController,
    String? Function(String?)? validator,
  })  : validator = validator ??
            defaultValidator, // Use defaultValidator if no validator is provided
        super(key: key);

  static String? defaultValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autocorrect: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AllColors.textColor,
        ),
        fillColor: AllColors.textFieldColor,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
