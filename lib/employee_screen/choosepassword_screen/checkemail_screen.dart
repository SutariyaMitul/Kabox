import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

import '../../Common/common_color.dart';



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
        bgColor: CommonColor.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 73),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: SvgPicture.asset("assets/images/checkingmail.svg",height: 84,width: 84,),
                  ),
                   Text(CommonText.checkYourEmail,
                      style: TextStyles.eighteenTSBlack),
                  const SizedBox(
                    height: 12,
                  ),
                   Text(CommonText.clickOnTheLink,
                      style: TextStyles.sixteenTGrey),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 42),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xff1A56DB),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(CommonText.openEmail,
                            style: TextStyles.sixteenTSWhite),
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
