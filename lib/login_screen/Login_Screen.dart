import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/employee_screen/choosepassword_screen/choosepasword_screen.dart';


import '../Common/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  CommonText.login,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),
                ),
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
                const SizedBox(
                  height: 18,
                ),
                 Text(
                  CommonText.password,
                  style: TextStyles.fourteenTSBlack,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextFormField(
                  controller: _passwordController,
                  labelText: CommonText.enterYourPassword,
                  labelStyles: TextStyles.fourteenTSGrey,
                  hintStyle: TextStyles.fourteenTSGrey,
                  suffixIcon: const Icon(Icons.apple_sharp),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff1A56DB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )),
                    height: 41,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        CommonText.login,
                        style: TextStyles.fourteenTSWhite,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ChoosePasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        CommonText.forgetYourPassword,
                        style: TextStyles.fourteenTSBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
             Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    CommonText.integritypolicy,
                    style: TextStyles.fourteenTSBlue,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
