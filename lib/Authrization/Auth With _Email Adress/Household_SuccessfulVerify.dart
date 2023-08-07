import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Household_SignIn.dart';

class SuccessfulVerify extends StatefulWidget {
  static String tag = '/GrocerySuccessfulVerify';

  @override
  _SuccessfulVerifyState createState() => _SuccessfulVerifyState();
}

class _SuccessfulVerifyState extends State<SuccessfulVerify> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              LogIn_ic_Successmark,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            text(PasswordChanged_Title,
                    fontSize: textSizeLarge, fontFamily: fontBold)
                .paddingTop(
              spacing_xlarge,
            ),
            text(
              PasswordChanged_PasswordSucuss,
              isCentered: true,
              maxLine: 5,
              textColor: textColorSecondary,
              fontSize: 15.0,
            ).paddingSymmetric(horizontal: spacingBig),
            elevatedButton(
              context,
              onPress: () {
                SignIn().launch(context);
              },
              width: double.infinity,
              widget: text(PasswordChanged_BackLogin,
                  textColor: Colors.white, fontFamily: fontMedium),
            ).paddingTop(spacing_xxLarge),
          ],
        ).paddingSymmetric(horizontal: spacing_twinty),
      ),
    );
  }
}
