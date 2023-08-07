import 'package:flutter/material.dart';
import 'package:household/Household%20User%20Side/Household_WelcomePage.dart';
import 'package:household/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Constant.dart';
import '../utils/Images.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/GrocerySplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    setStatusBarColor(colorPrimary);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Stack(
        children: <Widget>[
          Image.asset(Splash_ic_Building,
                  width: width * 0.6, height: width * 0.13, fit: BoxFit.fill)
              .center(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 56,
                width: width * 0.9,
                child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: grocery_color_white, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 0.8, //width of the border
                      ),
                    ),
                    onPressed: () {
                      welcomePage().launch(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    ),
                    label: Text(
                      'Get Started',
                      style: primaryTextStyle(
                        color: whiteColor,
                        size: 15,
                      ),
                    )),
              ),
            ),
          ).paddingBottom(spacing_xlarge)
        ],
      ),
    );
  }
}
