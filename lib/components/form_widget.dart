import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String hintTxt;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextEditingController controller;
  const FormWidget({super.key, required this.hintTxt, required this.fontSize, this.fontWeight, required this.controller, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.multiline,

      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: 1.35,
          //wordSpacing: -2
          letterSpacing: -0.2
      ),

      maxLines: null,
      decoration: InputDecoration(
          hintText: hintTxt,
          border: InputBorder.none,
         // hintStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)

      ),
    );
  }
}
