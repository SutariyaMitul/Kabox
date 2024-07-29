import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/splsh.svg",
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            const Text(
              CommonText.comeOnIn,
              style: TextStyles.eighteenTSBlack,
            ),
            const Text(
              CommonText.bookingsEasily,
              style: TextStyles.sixteenTGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff1A56DB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                height: 41,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    CommonText.createAccount,
                    style: TextStyles.fourteenTSWhite,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xff1A56DB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              height: 41,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  CommonText.login,
                  style: TextStyles.fourteenTSWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
