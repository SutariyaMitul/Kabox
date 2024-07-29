import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Common/common_appbar.dart';
import '../../Common/common_color.dart';
import '../../Common/common_text.dart';
import '../../Common/common_textfiled.dart';
import '../../Common/text_style.dart';

class AvaulableForWork extends StatefulWidget {
  const AvaulableForWork({super.key});

  @override
  State<AvaulableForWork> createState() => _AvaulableForWorkState();
}

class _AvaulableForWorkState extends State<AvaulableForWork> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController fromTimeController = TextEditingController();
  TextEditingController utilDateController = TextEditingController();
  TextEditingController utilTimeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(title: CommonText.availability,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Switch(value: switchState, onChanged: (value) {
                      if(switchState == true){
                        setState(() {
                          switchState = false;
                        });
                      }else{
                        setState(() {
                          switchState = true;
                        });
                      }
                    },
                      activeColor: Colors.white,
                      inactiveTrackColor: CommonColor.lightGrey,
                      activeTrackColor: CommonColor.blueColor,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text(CommonText.fulldDay,style: TextStyles.fourteenTSBlack,),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(CommonText.from,style: TextStyles.fourteenTSBlack,),
                ),
                CommonTextFormField(controller: fromDateController, labelText: CommonText.selectDate,labelStyles: TextStyles.fourteenTSGrey,preffixIcon: Icon(Icons.calendar_month,color: CommonColor.grayColor,),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CommonTextFormField(controller: fromTimeController, labelText: '00:00',labelStyles: TextStyles.fourteenTSGrey,preffixIcon: Icon(Icons.access_time,color: CommonColor.grayColor,),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(CommonText.until,style: TextStyles.fourteenTSBlack,),
                ),
                CommonTextFormField(controller: utilDateController, labelText: CommonText.selectDate,labelStyles: TextStyles.fourteenTSGrey,preffixIcon: Icon(Icons.calendar_month,color: CommonColor.grayColor,),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CommonTextFormField(controller: utilTimeController, labelText: '00:00',labelStyles: TextStyles.fourteenTSGrey,preffixIcon: Icon(Icons.access_time,color: CommonColor.grayColor,),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(CommonText.note,style: TextStyles.fourteenTSBlack,),
                ),
                CommonTextFormField(controller: noteController, labelText: CommonText.write_text_here,labelStyles: TextStyles.fourteenTSGrey,maxLines: 3,height: 100,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(CommonText.note_extrainfo,style: TextStyles.fourteenTSGrey,),
                ),
              ],
            ),
          ),
        ));
  }
}
