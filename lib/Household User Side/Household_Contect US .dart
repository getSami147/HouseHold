import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Widget.dart';

class ContectUs extends StatelessWidget {
  ContectUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    // setStatusBarColor(colorPrimary);
    changeStatusColor(Colors.transparent);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget('',
          elevation: 0,
          center: true,
          textColor: whiteColor,
          color: colorPrimary,
          titleWidget: text('Contect Us',
              textColor: whiteColor,
              fontSize: textSizeLargeMedium,
              fontWeight: FontWeight.w500)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text("About Us:",
              //         fontSize: textSizeNormal, fontWeight: FontWeight.w500)
              //     .paddingOnly(
              //         top: spacing_twinty,
              //         left: spacing_twinty,
              //         right: spacing_twinty),
              // text('I/ViewRootImpl@11e4bee[MainActivity]( 5128): mWNT: t = android.view.SurfaceControl$Transaction@1356e6b fN = 5 android.view.ViewRootImpl.prepareSurfaces:2778 android.view.ViewRootImpl.performTraversals:4024 and',
              //         maxLine: 10)
              //     .paddingSymmetric(horizontal: spacing_twinty),
              ContectProfile(
                containerText: "FrantEnd & BackEnd",
                mediaQuary: mediaQuary,
                image: ProfileImage,
                name: 'Sami Ullah Orakzai',
                job: 'Flutter Develper',
                ContectNo: "0330-3210550",
                email: 'Samiu09950@gmail',
              ),
              ContectProfile(
                containerText: "Figma Designer",
                mediaQuary: mediaQuary,
                image: profileImage2,
                name: 'Fahad Salih Hayat',
                job: 'Graphic & UI Designer',
                ContectNo: "0332-1407114",
                email: 'fahadsalihhayat56961@gmail.com',
              ),
              ContectProfile(
                containerText: "Future Develper",
                mediaQuary: mediaQuary,
                image: profileImage3,
                name: 'Naqeeb Ur Rehman',
                job: 'Future Develper',
                ContectNo: "0334-7545577",
                email: 'naqibokz84@gmail.com',
              ),
              SizedBox(
                height: spacing_twinty,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container FieldConatiner({required Size mediaQuary, title}) {
    return Container(
      alignment: Alignment.centerLeft,
      height: mediaQuary.width * .13,
      width: mediaQuary.width,
      decoration: BoxDecoration(
          color: iconGrey_color, borderRadius: BorderRadius.circular(15)),
      child: text(
        title.toString(),
      ).paddingLeft(spacing_middle),
    );
  }
}

// ignore: must_be_immutable
class ContectProfile extends StatelessWidget {
  String? containerText;
  String? image;
  String? name;
  String? job;
  String? ContectNo;
  String? email;

  ContectProfile(
      {Key? key,
      this.containerText,
      required this.mediaQuary,
      this.ContectNo,
      this.email,
      this.image,
      this.job,
      this.name})
      : super(key: key);

  final Size mediaQuary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: text(containerText,
              textColor: whiteColor, fontSize: textSizeNormal),
          decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: radiusCircular(25),
                bottomRight: radiusCircular(25),
              )),
        ).paddingTop(spacing_twinty),
        CircleAvatar(
          radius: 60,
          backgroundColor: colorPrimary,
          child: ClipOval(
              child: Image.asset(
            image.toString(),
            fit: BoxFit.cover,
            height: mediaQuary.width * .25,
            width: mediaQuary.width * .25,
          )),
        ).paddingTop(spacing_twinty),
        text(name, fontSize: textSizeNormal, fontWeight: FontWeight.w600),
        text(email, fontWeight: FontWeight.w500),
        text(job, fontWeight: FontWeight.w500),
        text(ContectNo, fontWeight: FontWeight.w500),
      ],
    );
  }
}
