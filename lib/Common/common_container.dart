import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {

  final Widget? child;
  final double radius;
  final Color color;
  final EdgeInsetsGeometry? padding;

  const CommonContainer({super.key,required this.radius,required this.color,required this.child, this.padding,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(radius),),
      padding: padding,
      child: child,
    );
  }
}
