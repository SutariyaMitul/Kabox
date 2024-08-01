import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kbox/Common/common_color.dart';
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
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confPassController = TextEditingController();

  bool passVisibility = false;
  bool conPassVisibility = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: CommonScaffold(
        bgColor: CommonColor.bgColor,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 82,),
               Text(CommonText.welcomeGlad,
                  style: TextStyles.eighteenTSBlack),
              const SizedBox(
                height: 35,
              ),
               Text(
                CommonText.choosePassword,
                style: TextStyles.fourteenTSDarkGrayMedium,
              ),
              const SizedBox(
                height: 2,
              ),
              CommonTextFormField(
                controller: _passController,
                labelText: CommonText.choosePassword,
                labelStyles: TextStyles.fourteenTSGrey,
                hintStyle: TextStyles.fourteenTSGrey,
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
                validator: (p0) {
                  if(p0!.isEmpty || p0.contains(' ')){
                    return CommonText.plzEnterPass;
                  }else{
                    return null;
                  }
                },
                // obscureText: choosPassShow == false? true:false,
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
                controller: _confPassController,
                labelText: CommonText.verifyPassword,
                labelStyles: TextStyles.fourteenTSGrey,
                hintStyle: TextStyles.fourteenTSGrey,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      if(conPassVisibility == false){
                        conPassVisibility = true;
                      }else{
                        conPassVisibility = false;
                      }
                    });
                  },
                  child: Icon(
                    conPassVisibility == false? Icons.visibility_outlined:Icons.visibility_off_outlined,
                    color: CommonColor.black,
                  ),
                ),
                obscureText: conPassVisibility == false? true:false,
                validator: (p0) {
                  if(p0!.isEmpty || p0.contains(' ')){
                    return CommonText.plzEnterPass;
                  }else{
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: InkWell(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      if(_passController.text == _confPassController.text){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ContinueScreen(),
                          ),
                        );
                      }else{
                        Fluttertoast.showToast(
                            msg: CommonText.passNotMatch,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
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
      ),
    );
  }
}
