import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final Icon prefixicon;
  final IconButton? suffixicon;

  CustomTextFormField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.prefixicon,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        height: 60,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixicon,
            prefixIcon: prefixicon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: Color(0xffB5B5C3))),
            labelText: labelText,
            hintText: hintText,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
