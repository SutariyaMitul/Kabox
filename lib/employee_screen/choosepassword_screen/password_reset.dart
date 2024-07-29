import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
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
                    child: Image.asset(
                      "assets/images/true_Icon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                   Text(CommonText.passwordReset,
                      style: TextStyles.twentyFourTSBlack),
                   Text(CommonText.successfullyReset,
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
                      child: Center(
                        child: Text(
                          CommonText.returnToApp,
                          style: TextStyles.fourteenTSWhite,
                        ),
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
