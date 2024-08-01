import 'package:flutter/cupertino.dart';
import 'package:kbox/Common/text_style.dart';

class CommonProfileItem extends StatelessWidget {
  final String title;
  final String detail;

  const CommonProfileItem(
      {super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.sixteenTSDarkGraySemiBold,
          ),
          Text(
            detail,
            style: TextStyles.sixteenTGrey,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
