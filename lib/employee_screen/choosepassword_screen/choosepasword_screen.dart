import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/choosepassword_screen/continue_screen.dart';


class ChoosePasswordScreen extends StatefulWidget {
  const ChoosePasswordScreen({super.key});

  @override
  State<ChoosePasswordScreen> createState() => _ChoosePasswordScreenState();
}

class _ChoosePasswordScreenState extends State<ChoosePasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(CommonText.welcomeGlad,
                style: TextStyles.eighteenTSBlack),
            const SizedBox(
              height: 25,
            ),
             Text(
              CommonText.choosePassword,
              style: TextStyles.fourteenTSBlack,
            ),
            const SizedBox(
              height: 14,
            ),
            CommonTextFormField(
              controller: _emailController,
              labelText: CommonText.choosePassword,
              labelStyles: TextStyles.fourteenTSGrey,
              hintStyle: TextStyles.fourteenTSGrey,
              suffixIcon: const Icon(Icons.apple_sharp),
            ),
            const SizedBox(
              height: 18,
            ),
             Text(
              CommonText.verifyPassword,
              style: TextStyles.fourteenTSBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            CommonTextFormField(
              controller: _passwordController,
              labelText: CommonText.verifyPassword,
              labelStyles: TextStyles.fourteenTSGrey,
              hintStyle: TextStyles.fourteenTSGrey,
              suffixIcon: const Icon(Icons.apple_sharp),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContinueScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff1A56DB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                  height: 41,
                  width: MediaQuery.of(context).size.width,
                  child:  Center(
                    child: Text(CommonText.Continue,
                        style: TextStyles.fourteenTSWhite),
                  ),
                ),
              ),
            ),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CommonText.continuing,
                  style: TextStyles.fourteenTSGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
