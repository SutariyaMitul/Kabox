import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/choosepassword_screen/checkemail_screen.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(CommonText.forgotYourPassword,
                style: TextStyles.eighteenTSBlack),
            const SizedBox(
              height: 15,
            ),
             Text(CommonText.codeToReset, style: TextStyles.sixteenTGrey),
            const SizedBox(
              height: 25,
            ),
             Text(
              CommonText.email,
              style: TextStyles.fourteenTSBlack,
            ),
            const SizedBox(
              height: 14,
            ),
            CommonTextFormField(
              controller: _emailController,
              labelText: CommonText.email,
              labelStyles: TextStyles.fourteenTSGrey,
              hintStyle: TextStyles.fourteenTSGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CheckEmailScreen(),
                    ),
                  );
                },
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
                      CommonText.resetPassword,
                      style: TextStyles.fourteenTSWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
