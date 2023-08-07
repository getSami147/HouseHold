import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Widget.dart';

class Bookingpage extends StatelessWidget {
  const Bookingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarProperty(context,
          title: text(Booking_Booking,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          titleCentre: true,
          leading: null,
          action: []),
      body: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              children: [
                TabBar(
                    labelStyle: TextStyle(
                        fontSize: textSizeMedium, fontWeight: FontWeight.w500),
                    labelColor: colorPrimary,
                    indicatorColor: colorPrimary,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: grey,
                    tabs: [
                      Tab(
                        text: Booking_Active,
                      ),
                      Tab(
                        text: Booking_History,
                      ),
                    ]),
                Expanded(
                  child: TabBarView(children: [
                    // Called Booking_Active......................................>>
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.symmetric(),
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderedHistory(
                                sericesTitle: Booking_ServicesName,
                                sericesStatus: Booking_ServicesStaus,
                                sericesName: Booking_Title,
                                sericesDate: Booking_Date,
                                sericesTime: Booking_Time,
                                TotalPrice: Booking_Price,
                                buttton: Booking_Cencle,
                              ).paddingSymmetric(vertical: spacing_twinty);
                            },
                          )
                        ],
                      ),
                    ),
                    //Called Booking_History......................................>>
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.symmetric(),
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderedHistory(
                                sericesTitle: Booking_ServicesName,
                                sericesStatus: Booking_ServicesStaus2,
                                sericesName: Booking_Title,
                                sericesDate: Booking_Date,
                                sericesTime: Booking_Time,
                                TotalPrice: Booking_Price,
                                buttton: Booking_BookAgain,
                              ).paddingSymmetric(vertical: spacing_twinty);
                            },
                          )
                        ],
                      ),
                    ),
                  ]).paddingSymmetric(horizontal: spacing_twinty),
                )
              ],
            ),
          )),
    );
  }
}
