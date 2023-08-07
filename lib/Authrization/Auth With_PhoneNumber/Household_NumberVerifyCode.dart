import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/Household%20User%20Side/Household_Dashboard.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

class NumberVerifyCode extends StatefulWidget {
  final String? VerficationId;

  NumberVerifyCode({
    super.key,
    required this.VerficationId,
  });

  @override
  State<NumberVerifyCode> createState() => _NumberVerifyCodeState();
}

class _NumberVerifyCodeState extends State<NumberVerifyCode> {
  final VerificationCodeController = TextEditingController();
  bool islooding = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarWidget('', elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('Enter Verification Code',
                  fontSize: textSizeNormal, fontWeight: FontWeight.w500)
              .paddingTop(spacing_standard_new),
          text("Enter the 6 Digit verification Code which you got by the SMS.",
                  maxLine: 5,
                  textColor: textColorSecondary,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontRegular)
              .paddingTop(spacing_standard_new),
          textformfield(
            controller: VerificationCodeController,
            keyboardType: TextInputType.number,
            obscureText: false,
            hinttext: 'Enter 6 Digit Code',
            prefixIcons: Icon(
              Icons.phone,
            ),
          ).paddingTop(spacing_standard_new),
          elevatedButton(
            context,
            looding: islooding,
            onPress: () async {
              setState(() {
                islooding = true;
              });
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.VerficationId.toString(),
                  smsCode: VerificationCodeController.text.toString());
              try {
                await auth.signInWithCredential(credential);
                Dashboard().launch(context);
              } catch (e) {
                setState(() {
                  islooding = false;
                });
                utils().toastMethod(e.toString());
              }
            },
            width: double.infinity,
            widget: text(
              LogIn_Login,
              textColor: Colors.white,
            ),
          ).paddingTop(spacing_xlarge),
        ],
      ).paddingSymmetric(horizontal: spacing_twinty),
    );
  }
}
