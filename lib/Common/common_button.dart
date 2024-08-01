import 'package:flutter/material.dart';
import 'package:kbox/Common/text_style.dart';

import 'common_color.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function()? onPress;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const CommonButton(
      {super.key, required this.onPress, required this.title, this.color, this.textStyle, this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 13),
          backgroundColor: color ?? CommonColor.colorBlue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        title,
        style: textStyle ?? TextStyles.fourteenTSWhiteMedium,
      ),
    );
  }
}
