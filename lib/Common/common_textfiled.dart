import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyles;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final int? maxLines;
  //final Widget? preffixIcon;

  CommonTextFormField({
    required this.controller,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.hintStyle,
    this.labelStyles,
    this.suffixIcon,
    this.height,
    this.maxLines,
    this.prefixIcon,
    //this.preffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyles,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          //alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          filled: true,
          fillColor: const Color(0xffF9FAFB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xffD1D5DB),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff1A56DB),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: CommonColor.borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),

        ),
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onTap: () {},
      ),
    );
  }
}
