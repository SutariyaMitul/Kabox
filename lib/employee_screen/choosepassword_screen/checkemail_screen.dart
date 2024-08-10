import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Common/common_color.dart';

class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key});

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bgColor: CommonColor.white,
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
                  child: SvgPicture.asset(
                    "assets/images/checkingmail.svg",
                    height: 84,
                    width: 84,
                  ),
                ),
                Text(CommonText.checkYourEmail,
                    style: TextStyles.eighteenTSBlack),
                const SizedBox(
                  height: 12,
                ),
                Text(CommonText.clickOnTheLink, style: TextStyles.sixteenTGrey),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 42),
                  child: InkWell(
                    onTap: openGmailHomePage,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff1A56DB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(CommonText.openEmail,
                            style: TextStyles.sixteenTSWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openGmailHomePage() async {
    const String gmailUrl = 'https://mail.google.com/';
    final Uri gmailAppUri = Uri.parse('googlegmail://inbox');
    if (await canLaunchUrl(gmailAppUri)) {
      await launchUrl(gmailAppUri);
    } else if (await canLaunchUrl(Uri.parse(gmailUrl))) {
      await launchUrl(Uri.parse(gmailUrl));
    } else {
      throw 'Could not launch Gmail';
    }
  }
}
