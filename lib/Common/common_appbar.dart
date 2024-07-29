import 'package:flutter/material.dart';
import 'package:kbox/Common/text_style.dart';

import 'common_color.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget? body;
  final bool? centerTitle;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const CommonAppbar(
      {super.key,
      required this.title,
      required this.body,
      this.centerTitle,
      this.floatingActionButton,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CommonColor.bgColor,
      appBar: AppBar(
        backgroundColor: CommonColor.blueColor,
        actions: actions,
        leadingWidth: 30,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyles.sixteenTSWhiteSemiBold,
        ),
        centerTitle: centerTitle ?? true,
      ),
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}
