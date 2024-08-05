import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/employee_screen/choosepassword_screen/choosepasword_screen.dart';
import 'package:kbox/employee_screen/choosepassword_screen/forget_screen.dart';
import 'package:kbox/employee_screen/home_screen/homescreen.dart';
import 'package:kbox/employee_screen/home_screen/main_activity.dart';

import '../Common/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passVisibility = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        bgColor: CommonColor.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CommonText.login,
                      style: TextStyles.eighteenTSBlack,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      CommonText.email,
                      style: TextStyles.fourteenTSBlackMedium,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CommonTextFormField(
                      controller: _emailController,
                      labelText: CommonText.email,
                      labelStyles: TextStyles.fourteenTSGrey,
                      hintStyle: TextStyles.fourteenTSGrey,
                      validator: (value) {
                        if(value!.isEmpty){
                          return CommonText.plzEnterEmail;
                        }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text) || value.contains(' ')) {
                          return CommonText.plzEnterValidEmail;
                        }else{
                          return null;
                        }
                      },
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
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if(value!.isEmpty || value.contains(' ')){
                          return CommonText.plzEnterPass;
                        }else{
                          return null;
                        }
                      },

                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            if(passVisibility == false){
                              passVisibility = true;
                            }else{
                              passVisibility = false;
                            }
                        });
                        },
                        child: Icon(
                          passVisibility == false? Icons.visibility_outlined:Icons.visibility_off_outlined,
                          color: CommonColor.black,
                        ),
                      ),
                      obscureText: passVisibility == false? true:false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 31, bottom: 19),
                      child: InkWell(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: CommonColor.blueWhiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
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
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          CommonText.forgetYourPassword,
                          style: TextStyles.fourteenTSBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        CommonText.integritypolicy,
                        style: TextStyles.fourteenTSBlue,
                      ),
                      SizedBox(height: 13,),
                      Text(
                        "${CommonText.version} 1.6.1",
                        style: TextStyles.fourteenTSGrey,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
