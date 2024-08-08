import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';

class ProfileEditBottomSheet extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController mobileController;
  final TextEditingController languageController;
  final TextEditingController personNumController;
  final VoidCallback onSave;

  ProfileEditBottomSheet({
    required this.emailController,
    required this.addressController,
    required this.mobileController,
    required this.languageController,
    required this.personNumController,
    required this.onSave,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      color: CommonColor.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Email"),
              CommonTextFormField(
                controller: emailController,
                labelText: 'Email',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Address"),
              CommonTextFormField(
                controller: addressController,
                labelText: 'Address',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("MobileNumber"),
              CommonTextFormField(
                controller: mobileController,
                labelText: 'MobileNumber',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Personnummer"),
              CommonTextFormField(
                labelStyles: TextStyles.fourteenTSGreySemi,
                controller: personNumController,
                labelText: 'Personnummer',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Language"),
              CommonTextFormField(
                labelStyles: TextStyles.fourteenTSGreySemi,
                controller: languageController,
                labelText: 'language',
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  onSave();
                  Navigator.pop(context);
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
                      'Save',
                      style: TextStyles.fourteenTSWhite,
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

class BankInfoEditBottomSheet extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController bankController;
  final TextEditingController clearingController;
  final TextEditingController konController;
  final VoidCallback onSave;

  BankInfoEditBottomSheet({
    required this.onSave,
    required this.nameController,
    required this.bankController,
    required this.clearingController,
    required this.konController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      color: CommonColor.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Namn"),
              CommonTextFormField(
                controller: nameController,
                labelText: 'Namn',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Bank"),
              CommonTextFormField(
                controller: bankController,
                labelText: 'Bank',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Clearing nummer"),
              CommonTextFormField(
                controller: clearingController,
                labelText: 'Clearing nummer',
                labelStyles: TextStyles.fourteenTSGreySemi,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Kontonummer"),
              CommonTextFormField(
                labelStyles: TextStyles.fourteenTSGreySemi,
                controller: konController,
                labelText: 'Kontonummer',
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  onSave();
                  Navigator.pop(context);
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
                      'Save',
                      style: TextStyles.fourteenTSWhite,
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
