import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? bgColor;

  CommonScaffold({
    this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: SvgPicture.asset("assets/images/kabox_symbol.svg")
              ),
              Expanded(
                child: body, // Display the provided body widget
              ),
            ],
          ),
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
