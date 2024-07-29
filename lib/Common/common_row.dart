import 'package:flutter/material.dart';

class CommonRow extends StatelessWidget {
  final String iconsPath;
  final String text;
  final TextStyle? textStyle;
  const CommonRow({super.key,required this.iconsPath,required this.text,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconsPath,width: 20,height: 20,fit: BoxFit.fill,),
          const SizedBox(width: 10),
          Text(text,style: textStyle,)
        ],
      ),
    );
  }
}
