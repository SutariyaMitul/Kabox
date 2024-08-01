import 'package:flutter/cupertino.dart';

class CommonBorderContainer extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Widget child;
  final double? width;
  const CommonBorderContainer({super.key,required this.color,required this.borderColor,required this.child,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(8),border: Border.all(color: borderColor,width: 1,strokeAlign: BorderSide.strokeAlignCenter,)),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: child,
    );
  }
}
