import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbox/Common/common_color.dart';
import 'package:kbox/Common/text_style.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {

  List<Map<String,dynamic>> checkListData = [
    {
      'title':'Home-cleaning Bathroom',
      'items':['Remove the color from the wall','Clean the toilet seat','Clean the toilet seat','Item 4','Item 5']
    },
    {
      'title':'Kitchen',
      'items':['Remove the color from the wall','Take picture','Add it here','Item 4','Item 5']
    }
  ];
  late bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.bgColor,
      body: ListView.builder(
        shrinkWrap: true,
      itemCount: checkListData.length,itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,bottom: 10),
                child: Text(checkListData[index]['title'],style: TextStyles.sixteenTSBlackSemiBold,),
              ),

              ListView.builder(shrinkWrap: true,itemCount: checkListData[index]['items'].length,itemBuilder: (context, index2) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(value: false, onChanged: (value) {

                        setState(() {
                          isChecked = value!;
                        });
                    },),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(checkListData[index]['items'][index2],style: TextStyles.fifteenTSDarkGrayRegularFour,),
                    )
                  ],
                );
              },)

            ],
          ),
        );
      },)
    );
  }
}
