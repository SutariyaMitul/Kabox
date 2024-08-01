import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonInfoItem extends StatelessWidget {
  final String svgPath;
  final String? description;
  final TextStyle? textStyle;
  final double? bottomMargin;
  final double? height;
  final double? width;
  const CommonInfoItem({super.key,required this.svgPath,this.description,this.textStyle,this.bottomMargin, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin??10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgPath,height: height ?? 19,width: width ?? 19,fit: BoxFit.fill,),
          const SizedBox(width: 8,),
          Expanded(child: Text(description!,style: textStyle,softWrap: true,),),
        ],
      ),
    );
  }
}

