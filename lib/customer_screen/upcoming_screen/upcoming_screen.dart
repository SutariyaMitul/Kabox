import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbox/Common/common_scaffold.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/text_style.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            CommonText.upcomingCleanings,
            style: TextStyles.eighteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            CommonText.yourUpcomingCleanings,
            style: TextStyles.fourteenTSGrey,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading:  Text(
                        "16 Apr",
                        style: TextStyles.fourteenTSGrey,
                      ),
                      title: Row(
                        children: [
                          Container(
                            height: 67,
                            width: 12,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                          ),
                          Container(
                            height: 67,
                            width: MediaQuery.of(context).size.width / 1.8,
                            //color: Color(0xffEBF5FF),
                            decoration: const BoxDecoration(
                              color: Color(0xffEBF5FF),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      CommonText.homeCleaning,
                                      style: TextStyles.sixteenBlue,
                                    ),
                                    Text(
                                      "13:00 - 15:00",
                                      style: TextStyles.fourteenTSBlack,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward,color: Colors.grey,),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}
