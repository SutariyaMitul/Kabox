import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:kbox/employee_screen/choosepassword_screen/password_reset.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CommonScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            CommonText.resetPassword,
            style: TextStyles.eighteenTSBlack,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            CommonText.chooseNewPassword,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 10,
          ),
          CommonTextFormField(
            controller: _emailController,
            labelText: CommonText.enterNewPassword,
            labelStyles: TextStyles.fourteenTSGrey,
            hintStyle: TextStyles.fourteenTSGrey,
            suffixIcon: const Icon(Icons.apple_sharp),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            CommonText.verifyPassword,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 10,
          ),
          CommonTextFormField(
            controller: _passwordController,
            labelText: CommonText.enterPasswordAgain,
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
                    builder: (context) => const PasswordReset(),
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
                child: const Center(
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
    ));
  }
}
