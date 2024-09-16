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

  List<Map<String, dynamic>> checkListData = [
    {
      'title': 'Home-cleaning Bathroom',
      'items': [
        {'name': 'Remove the color from the wall', 'isChecked': false},
        {'name': 'Clean the toilet seat', 'isChecked': true},
        {'name': 'Clean the toilet seat', 'isChecked': false},
        {'name': 'Item 4', 'isChecked': true},
        {'name': 'Item 5', 'isChecked': false}
      ]
    },
    {
      'title': 'Kitchen',
      'items': [
        {'name': 'Remove the color from the wall', 'isChecked': false},
        {'name': 'Take picture', 'isChecked': false},
        {'name': 'Add it here', 'isChecked': true},
        {'name': 'Item 4', 'isChecked': false},
        {'name': 'Item 5', 'isChecked': false}
      ]
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
                return CheckboxListTile(value: isChecked, onChanged: (value) {
                  isChecked == value;
                  setState(() {

                  });
                },
                title: Text(checkListData[index]['items'][index2]['name'],style: TextStyles.fifteenTSDarkGrayRegularFour,),
                  controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  side: BorderSide(color: CommonColor.borderColor,width: 1),
                  visualDensity: const VisualDensity(horizontal: -4,vertical: -3.5),
                );
              },)

            ],
          ),
        );
      },)
    );
  }
}
