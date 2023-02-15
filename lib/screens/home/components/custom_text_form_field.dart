import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.labelName,
      required this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.validator})
      : super(key: key);

  final String labelName;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style:const  TextStyle(
        fontFamily: "Roboto",
        fontSize: 15,
        color:Colors.black54,
      ),
      decoration: InputDecoration(labelText: labelName),
    );
  }
}
