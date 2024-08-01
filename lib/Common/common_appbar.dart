import 'package:flutter/material.dart';
import 'package:kbox/Common/text_style.dart';
import 'common_color.dart';

class CommonAppbar extends StatefulWidget {
  final String title;
  final Widget? body;
  final bool? centerTitle;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? bottom;

  const CommonAppbar(
      {super.key,
      required this.title,
      required this.body,
      this.centerTitle,
      this.floatingActionButton,
      this.actions, this.bottomNavigationBar, this.bottom});

  @override
  State<CommonAppbar> createState() => _CommonAppbarState();
}

class _CommonAppbarState extends State<CommonAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CommonColor.bgColor,
      resizeToAvoidBottomInset: false,
      backgroundColor: CommonColor.bgColor,
      appBar: AppBar(
        bottom: widget.bottom,
        backgroundColor: CommonColor.blueColor,
        actions: widget.actions,
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
          widget.title,
          style: TextStyles.sixteenTSWhiteSemiBold,
        ),
        centerTitle: widget.centerTitle ?? true,
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: widget.body
    );
  }
}
