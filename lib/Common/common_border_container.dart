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
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(8),border: Border.all(color: borderColor,width: 1)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: child,
    );
  }
}
