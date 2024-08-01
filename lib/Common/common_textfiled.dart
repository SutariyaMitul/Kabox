import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/text_style.dart';

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
    this.maxLines,
    this.prefixIcon,
    //this.preffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        style: TextStyles.fourteenTSBlack,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyles,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          //alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          filled: true,
          fillColor: CommonColor.textInputBgColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: CommonColor.borderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CommonColor.blueColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: CommonColor.borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
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
