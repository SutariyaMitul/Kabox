import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kbox/Common/common_button.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_profile_item.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CommonColor.lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CommonColor.colorBlue,
        title: Text(
          "Profile",
          style: TextStyles.eighteenTSWhiteSemiBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/profileimage2.jpg",
                        fit: BoxFit.fill,
                        height: 72,
                        width: 72,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Christian Jebrail",
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyles.eighteenTSBlack,
                      ),
                      const SizedBox(height: 11),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              CommonText.changephoto,
                              style: TextStyles.twelveTSBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              CommonText.removephoto,
                              style: TextStyles.twelveRed,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Divider(
                  height: 0.5,
                  color: CommonColor.greyShade,
                ),
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: CommonColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CommonText.generalinfo,
                      style: TextStyles.sixteenGreySemiBold,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    const CommonProfileItem(
                      title: CommonText.email,
                      detail: "christian@dreamclean.nu",
                    ),
                    const CommonProfileItem(
                      title: CommonText.adress,
                      detail: "Huskvarnavägen 62 554 54 Jönköping",
                    ),
                    const CommonProfileItem(
                      title: CommonText.mobilenum,
                      detail: "0735914241",
                    ),
                    const CommonProfileItem(
                      title: CommonText.personnum,
                      detail: "931025-3019",
                    ),
                    const CommonProfileItem(
                      title: CommonText.language,
                      detail: "Swedish",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    CommonButton(
                      onPress: () {},
                      title: CommonText.edit,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CommonText.bankinformation,
                      style: TextStyles.sixteenGreySemiBold,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    const CommonProfileItem(
                      title: CommonText.namn,
                      detail: "Christian Jebrail",
                    ),
                    const CommonProfileItem(
                      title: CommonText.bank,
                      detail: "Nordea",
                    ),
                    const CommonProfileItem(
                      title: CommonText.clearingnummer,
                      detail: "9021",
                    ),
                    const CommonProfileItem(
                      title: CommonText.kontonummer,
                      detail: "705 124 88",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Divider(
                        height: 0.2,
                        color:CommonColor.greyShade,
                      ),
                    ),
                    CommonButton(onPress: () {}, title: CommonText.edit)
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CommonText.bankinformation,
                      style: TextStyles.sixteenGreySemiBold,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CommonText.storage,
                            style: TextStyles.sixteenTSDarkGraySemiBold,
                          ),
                          InkWell(
                            onTap: ()async {
                              await requestStoragePermission();
                              await accessExternalStorage();
                            },
                            child: Text(
                              "Not Allow",
                              style: TextStyles.sixteenRedRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CommonText.camera,
                            style: TextStyles.sixteenTSDarkGraySemiBold,
                          ),
                          InkWell(
                            onTap: () {
                              requestCameraPermission();
                            },
                            child: Text(
                              "Not Allow",
                              style: TextStyles.sixteenRedRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CommonText.location,
                            style: TextStyles.sixteenTSDarkGraySemiBold,
                          ),
                          InkWell(
                            onTap: () async {
                              //requestLocationPermission();
                            },
                            child: Text(
                              "Not Allow",
                              style: TextStyles.sixteenRedRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CommonText.policyinfo,
                            style: TextStyles.sixteenTSDarkGraySemiBold,
                          ),
                          Text(
                            CommonText.integritypolicy,
                            style: TextStyles.sixteenBlueRegular,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CommonText.appversion,
                            style: TextStyles.sixteenTSDarkGraySemiBold,
                          ),
                          Text(
                            "1.6.1",
                            style: TextStyles.sixteenTSBlack,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CommonButton(
                  onPress: () {},
                  title: CommonText.logout,
                  color: CommonColor.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> accessExternalStorage() async {
  Directory? directory = await getExternalStorageDirectory();
  if (directory != null) {
    print("External storage directory: ${directory.path}");
    File file = File('${directory.path}/example.txt');
    await file.writeAsString('Hello, Flutter!');
    print("File written: ${file.path}");
    String contents = await file.readAsString();
    print("File contents: $contents");
  } else {
    print("Could not access external storage directory");
  }
}

Future<void> requestStoragePermission() async {
  PermissionStatus status = await Permission.storage.request();
  if (status.isGranted) {
    print("Storage permission granted");
  } else if (status.isDenied) {
    print("Storage permission denied");
  } else if (status.isPermanentlyDenied) {
    print("Storage permission permanently denied");
    await openAppSettings();
  }
}

Future<void> requestCameraPermission() async {
  PermissionStatus status = await Permission.camera.request();
  if (status.isGranted) {
    print("Camera permission granted");
  } else if (status.isDenied) {
    print("Camera permission denied");
  } else if (status.isPermanentlyDenied) {
    print("Camera permission permanently denied");
    await openAppSettings();
  }
}

/*Future<void> requestLocationPermission() async {
  PermissionStatus status = await Permission.location.request();
  if (status.isGranted) {
    print("Location permission granted");
  } else if (status.isDenied) {
    print("Location permission denied");
  } else if (status.isPermanentlyDenied) {
    print("Location permission permanently denied");
    await openAppSettings();
  }
}*/
