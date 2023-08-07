import 'package:flutter/material.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Authrization/Auth With _Email Adress/Household_SignIn.dart';
import '../Authrization/Auth With _Email Adress/Household_SignUp.dart';
import '../utils/Strings.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'images/building.png',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(Welcome_Text,
                        maxLine: 5,
                        textColor: whiteColor,
                        fontSize: textSizeLarge,
                        fontWeight: FontWeight.w600)
                    .paddingRight(spacing_large),
                text(
                  welcome_Subtitle,
                  maxLine: 5,
                  textColor: whiteColor,
                  fontFamily: 'Poppins',
                ).paddingOnly(
                  top: spacing_middle,
                  // right: spacing_middle,
                )
              ],
            ).paddingSymmetric(horizontal: spacing_twinty),
          ),
          Positioned(
            bottom: 100,
            left: 10,
            right: 10,
            child: OutlineButton(
              radius: 8,
              textContent: welcome_Login,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
            ),
          ),
          Positioned(
            bottom: 25,
            left: 10,
            right: 10,
            child: OutlineButton(
              radius: 8,
              isStroked: true,
              textContent: welcome_Register,
              bodercolor: whiteColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
