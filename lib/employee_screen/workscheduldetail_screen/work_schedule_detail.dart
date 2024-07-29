import 'package:flutter/material.dart';
import '../../Common/common_appbar.dart';
import '../../Common/common_button.dart';
import '../../Common/common_color.dart';
import '../../Common/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kbox/Common/common_info_item.dart';
import 'package:kbox/Common/common_text.dart';

class WorkScheduleDetail extends StatefulWidget {
  const WorkScheduleDetail({super.key});

  @override
  State<WorkScheduleDetail> createState() => _WorkScheduleDetailState();
}

class _WorkScheduleDetailState extends State<WorkScheduleDetail> {
  bool clockStatus = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CommonAppbar(
      title: 'Back',
      centerTitle: false,
      /*actions: [
        Container(
          height: 50,
          //width: MediaQuery.of(context).size.width/4,
          color: CommonColor.greyColor,
          margin: const EdgeInsets.all(15),
          child: const DropdownButtonHideUnderline(
            child: Text('hello'),
          ),
        )
      ],*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CommonColor.colorBlue,
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          "assets/images/add_photo.svg",
          height: 22,
          width: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonButton(onPress: () {}, title: CommonText.checkin),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CommonButton(
                      onPress: () {},
                      title: CommonText.markcompleted,
                      color: CommonColor.greenColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Column(
                    children: [
                      Text(
                        CommonText.workingtime,
                        style: TextStyles.fourteenTSBlackMedium,
                      ),
                      Text(
                        "00:00:00",
                        style: TextStyles.twentyBlue,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CommonColor.lightgreenColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CommonColor.greenColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            CommonText.tagofservice,
                            style: TextStyles.twelveTSGreen,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "DATE",
                                style: TextStyles.fourteenTSBlueSemiBold,
                              ),
                              Text(
                                "Mon, Sep 18, 2023",
                                style: TextStyles.sixteenTSDarkGrayRegular,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "TIME",
                                style: TextStyles.fourteenTSBlueSemiBold,
                              ),
                              Text(
                                "09:00 - 12:00",
                                style: TextStyles.sixteenTSDarkGrayRegular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Divider(height: 2,color: CommonColor.colorBlue,),
                          Container(
                              decoration: BoxDecoration(
                                color: CommonColor.lightGreyColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: const Text(
                                CommonText.notcompleted,
                                style: TextStyles.twelveTSGrey,
                              )),
                          // Divider(height: 2,color: CommonColor.colorBlue,),
                        ],
                      ),
                    ),
                    const Text(
                      CommonText.customer,
                      style: TextStyles.fourteenTSBlueSemiBold,
                    ),
                    Text(
                      "John Smith",
                      style: TextStyles.sixteenTSDarkGrayRegular,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Huskvarnavägen 62",
                                style: TextStyles.sixteenTSDarkGrayRegular,
                              ),
                              const Text(
                                "554 54 Jönköping",
                                style: TextStyles.sixteenTGrey,
                              ),
                            ],
                          ),
                          //const Spacer(),
                          Row(
                            children: [
                              const Text(
                                CommonText.viewdirection,
                                style: TextStyles.fourteenTSBlue,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "assets/images/arrow_right.svg",
                                width: 10,
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonInfoItem(
                      svgPath: "assets/images/key.svg",
                      description: CommonText.key_num_desc,
                      textStyle: TextStyles.fourteenTSBlack,
                    ),
                    CommonInfoItem(
                      svgPath: "assets/images/pass_description.svg",
                      description: CommonText.key_num_desc_detail,
                      textStyle: TextStyles.fourteenTSBlack,
                      bottomMargin: 0.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonInfoItem(
                      svgPath: "assets/images/note.svg",
                      description: CommonText.note,
                      textStyle: TextStyles.sixteenBlueSemiBold,
                    ),
                    Text(
                      CommonText.note_detail,
                      style: TextStyles.fourteenTSBlack,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonInfoItem(
                      svgPath: "assets/images/description_icon.svg",
                      description: CommonText.product_description,
                      textStyle: TextStyles.sixteenBlueSemiBold,
                    ),
                    Text(
                      CommonText.product_description_detail,
                      style: TextStyles.fourteenTSBlack,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonInfoItem(
                      svgPath: "assets/images/person_icon.svg",
                      description: CommonText.otherson_location,
                      textStyle: TextStyles.sixteenBlueSemiBold,
                    ),
                    Text(
                      "Full name (time that they are scheduled)",
                      style: TextStyles.fourteenTSBlack,
                    ),
                    Text(
                      CommonText.phone_number,
                      style: TextStyles.fourteenTSBlueSemiBold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Full name (09:30 - 11:00)",
                      style: TextStyles.fourteenTSBlack,
                    ),
                    Text(
                      CommonText.phone_number,
                      style: TextStyles.fourteenTSBlueSemiBold,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
