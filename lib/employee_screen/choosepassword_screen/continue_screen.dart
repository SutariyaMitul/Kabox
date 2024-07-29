import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

class ContinueScreen extends StatefulWidget {
  const ContinueScreen({super.key});

  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                CommonText.greatNow,
                style: TextStyles.eighteenTSBlack
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
             CommonText.mobileDevice,
                style: TextStyles.sixteenTGrey
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/playstore.png"),
                  Expanded(child: Image.asset("assets/images/playstore.png")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
