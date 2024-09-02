import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 20, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CommonText.attachment,
                style: TextStyles.eighteenTSBlackSemiBold,
              ),
              const SizedBox(height: 15,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {

              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: CommonColor.greenGrayColor, width: 1),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/profileimage2.jpg",
                    height: 39,
                    width: 43,
                  ),
                  title: Text(
                    CommonText.pictureofbathroom,
                    style: TextStyles.fourteenTSBlack,
                  ),
                  subtitle: Text("12.4 MB",style: TextStyles.thirtyTSDarkGray,),
                  trailing: Builder(
                    builder: (BuildContext context) {
                      return PopupMenuButton<String>(
                        color: Colors.white,
                        onSelected: (value) {
                          // Handle the selected menu item here
                          print('Selected: $value');
                        },
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem(
                                  value: CommonText.view,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 100),
                                    child: Text(
                                      CommonText.view,
                                      style: TextStyles.fourteenTSBlack,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: CommonText.download,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 100),
                                    child: Text(
                                      CommonText.download,
                                      style: TextStyles.fourteenTSBlack,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: CommonText.delete,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 100),
                                    child: Text(
                                      CommonText.delete,
                                      style: TextStyles.fourteenRedRegular,
                                    ),
                                  ),
                                ),
                              ],
                      );
                    },
                  ),
                )
              );
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}
