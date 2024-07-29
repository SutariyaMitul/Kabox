import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';



class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key});

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Image.asset("assets/images/releases.png"),
                  ),
                  const Text(CommonText.checkYourEmail,
                      style: TextStyles.eighteenTSBlack),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(CommonText.clickOnTheLink,
                      style: TextStyles.sixteenTGrey),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xff1A56DB),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          )),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(CommonText.openEmail,
                            style: TextStyles.fourteenTSWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
