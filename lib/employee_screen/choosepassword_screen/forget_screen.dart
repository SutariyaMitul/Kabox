import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonScaffold(
        bgColor: CommonColor.white,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 88,),
               Text(CommonText.forgotYourPassword,
                  style: TextStyles.eighteenTSBlack),
              const SizedBox(
                height: 11,
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
                height: 2,
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
                      .hasMatch(_emailController.text)){
                    return CommonText.plzEnterValidEmail;
                  }else{
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: InkWell(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CheckEmailScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: CommonColor.blueWhiteColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        )),
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        CommonText.resetPassword,
                        style: TextStyles.sixteenTSWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
