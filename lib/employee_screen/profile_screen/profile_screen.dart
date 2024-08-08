import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kbox/Common/common_bottomsheet.dart';
import 'package:kbox/Common/common_button.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_profile_item.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPermissionGranted = false;
  bool _isStoragePermissionGranted = false;
  bool _isLocationPermissionGranted = false;
  bool isGranted = false;
  bool isLocationGranted = false;

  @override
  void initState() {
    super.initState();
    _checkStoredPermission();
    _checkCameraPermission();
    _checkLocationPermission();
  }

  Future<void> _checkStoredPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isStorageGranted = prefs.getBool('storage_permission_granted');
    setState(() {
      _isStoragePermissionGranted = isStorageGranted!;
    });
  }

  Future<void> _checkCameraPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isGranted = prefs.getBool('camera_permission_granted');
    setState(() {
      _isPermissionGranted = isGranted!;
    });
  }

  Future<void> _checkLocationPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLocationGranted = prefs.getBool('location_permission_granted');
    setState(() {
      _isLocationPermissionGranted = isLocationGranted!;
    });
  }

  Future<void> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (status.isGranted) {
      print("Camera permission granted");
      await prefs.setBool('camera_permission_granted', true);
      setState(() {
        _isPermissionGranted = true;
      });
    } else if (status.isDenied) {
      print("Camera permission denied");
      await prefs.setBool('camera_permission_granted', false);
      setState(() {
        _isPermissionGranted = false;
      });
    } else if (status.isPermanentlyDenied) {
      print("Camera permission permanently denied");
      await prefs.setBool('camera_permission_granted', false);
      await openAppSettings();
      setState(() {
        _isPermissionGranted = false;
      });
    }
  }

  Future<void> _requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (status.isGranted) {
      print("Storage permission granted");
      await prefs.setBool('storage_permission_granted', true);
      setState(() {
        _isStoragePermissionGranted = true;
      });
      _accessExternalStorage();
    } else if (status.isDenied) {
      print("Storage permission denied");
      await prefs.setBool('storage_permission_granted', false);
      setState(() {
        _isStoragePermissionGranted = false;
      });
    } else if (status.isPermanentlyDenied) {
      print("Storage permission permanently denied");
      await prefs.setBool('storage_permission_granted', false);
      await openAppSettings();
      setState(() {
        _isStoragePermissionGranted = false;
      });
    }
  }

  Future<void> _accessExternalStorage() async {
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

  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (status.isGranted) {
      print("Location permission granted");
      await prefs.setBool('location_permission_granted', true);
      setState(() {
        _isLocationPermissionGranted = true;
      });
    } else if (status.isDenied) {
      print("Location permission denied");
      await prefs.setBool('location_permission_granted', false);
      setState(() {
        _isLocationPermissionGranted = false;
      });
    } else if (status.isPermanentlyDenied) {
      print("Location permission permanently denied");
      await prefs.setBool('location_permission_granted', false);
      await openAppSettings();
      setState(() {
        _isLocationPermissionGranted = false;
      });
    }
  }

  final picker = ImagePicker();
  File? galleryFile;

  void _removeImage() {
    setState(() {
      galleryFile = null;
    });
  }

  String email = "christian@dreamclean.nu";
  String address = "Huskvarnavägen";
  String mobileNum = "0735914241";
  String language = "Swedish";
  String personNum = "931025-3019";

  void showProfileEditBottomSheet(BuildContext context) {
    final emailController = TextEditingController(text: email);
    final addressController = TextEditingController(text: address);
    final mobileNumController = TextEditingController(text: mobileNum);
    final personNumController = TextEditingController(text: personNum);
    final languageController = TextEditingController(text: language);

    showModalBottomSheet(
      backgroundColor: CommonColor.white,
      isScrollControlled: true,
      showDragHandle: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return ProfileEditBottomSheet(
          emailController: emailController,
          addressController: addressController,
          mobileController: mobileNumController,
          languageController: languageController,
          personNumController: personNumController,
          onSave: () {
            setState(() {
              email = emailController.text;
              address = addressController.text;
              mobileNum = mobileNumController.text;
              language = languageController.text;
              personNum = personNumController.text;

            });
          },
        );
      },
    );
  }

  String namn = "Christian Jebrail";
  String bank = "Nordea";
  String clearing = "9021";
  String kontonummer = "705 124 88";

  void bankEditBottomSheet(BuildContext context) {
    final namnController = TextEditingController(text: namn);
    final bankController = TextEditingController(text: bank);
    final clearingNumController = TextEditingController(text: clearing);
    final kontonummerController = TextEditingController(text: kontonummer);

    showModalBottomSheet(
      backgroundColor: CommonColor.white,
      isScrollControlled: true,
      showDragHandle: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return BankInfoEditBottomSheet(
          bankController: bankController,
          nameController: namnController,
          konController: kontonummerController,
          clearingController: clearingNumController,
          onSave: () {
            setState(() {
              namn = namnController.text;
              bank = bankController.text;
              clearing = clearingNumController.text;
              kontonummer = kontonummerController.text;
            });
          },
        );
      },
    );
  }

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
                    backgroundColor: CommonColor.white,
                    radius: 36,
                    child: ClipOval(
                      child: galleryFile == null
                          ? Image.asset(
                              "assets/images/profileimage2.jpg",
                              fit: BoxFit.fill,
                              height: 72,
                              width: 72,
                            )
                          : Image.file(
                              galleryFile!,
                              fit: BoxFit.fill,
                              height: 72,
                              width: 72,
                            ),
                      /*Image.asset(
                        "assets/images/profileimage2.jpg",
                        fit: BoxFit.fill,
                        height: 72,
                        width: 72,
                      ),*/
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
                            onTap: () {
                              _showPicker(context: context);
                            },
                            child: Text(
                              CommonText.changephoto,
                              style: TextStyles.twelveTSBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: _removeImage,
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
                    CommonProfileItem(
                      title: CommonText.email,
                      detail: email,
                    ),
                    CommonProfileItem(
                      title: CommonText.adress,
                      detail: address,
                    ),
                    CommonProfileItem(
                      title: CommonText.mobilenum,
                      detail: mobileNum,
                    ),
                    CommonProfileItem(
                      title: CommonText.personnum,
                      detail: personNum,
                    ),
                    CommonProfileItem(
                      title: CommonText.language,
                      detail: language,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    CommonButton(
                      onPress: () {
                        showProfileEditBottomSheet(context);
                      },
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
                    CommonProfileItem(
                      title: CommonText.namn,
                      detail: namn,
                    ),
                    CommonProfileItem(
                      title: CommonText.bank,
                      detail: bank,
                    ),
                    CommonProfileItem(
                      title: CommonText.clearingnummer,
                      detail: clearing,
                    ),
                    CommonProfileItem(
                      title: CommonText.kontonummer,
                      detail: kontonummer,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11.0),
                      child: Divider(
                        height: 0.2,
                        color: CommonColor.greyShade,
                      ),
                    ),
                    CommonButton(
                        onPress: () {
                          bankEditBottomSheet(context);
                        },
                        title: CommonText.edit)
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
                            onTap: () async {
                              await _requestStoragePermission();
                              // await accessExternalStorage();
                            },
                            child: Text(
                              _isStoragePermissionGranted
                                  ? CommonText.allowed
                                  : CommonText.notAllowed,
                              style: _isStoragePermissionGranted
                                  ? TextStyles.sixteenGreenRegular
                                  : TextStyles.sixteenRedRegular,
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
                              _requestCameraPermission();
                            },
                            child: Text(
                              _isPermissionGranted
                                  ? CommonText.allowed
                                  : CommonText.notAllowed,
                              style: _isPermissionGranted
                                  ? TextStyles.sixteenGreenRegular
                                  : TextStyles.sixteenRedRegular,
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
                              _requestLocationPermission();
                            },
                            child: Text(
                              _isLocationPermissionGranted
                                  ? CommonText.allowed
                                  : CommonText.notAllowed,
                              style: _isLocationPermissionGranted
                                  ? TextStyles.sixteenGreenRegular
                                  : TextStyles.sixteenRedRegular,
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

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    setState(
      () {
        if (pickedFile != null) {
          galleryFile = File(pickedFile.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
