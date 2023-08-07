import 'package:flutter/material.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/Images.dart';

class NotificationFull extends StatelessWidget {
  const NotificationFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('',
          elevation: 0,
          center: true,
          titleWidget: text(Notifcation_Notification,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(ProfileImage),
                  ),
                  title: text(
                    Notifcationful_Name,
                    fontSize: textSizeSMedium,
                    textColor: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: text(Notifcationful_Title,
                      fontSize: textSizeSmall,
                      textColor: blackColor,
                      maxLine: 2),
                  trailing: text(
                    Notifcationful_Time,
                    fontSize: textSizeSmall,
                  ),
                ).paddingTop(spacing_middle);
              },
            ).paddingTop(spacing_twinty),
          ]).paddingSymmetric(horizontal: spacing_large),
        ),
      ),
    );
  }
}
