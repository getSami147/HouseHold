import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/Household_SignIn.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../State Management/Sign In Provider.dart';

class VerifySignUp extends StatefulWidget {
  const VerifySignUp({
    Key? key,
  }) : super(key: key);
  @override
  State<VerifySignUp> createState() => _VerifySignUpState();
}

class _VerifySignUpState extends State<VerifySignUp> {
  final OTPController = TextEditingController();

  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).checkEmail =
        FirebaseAuth.instance.currentUser!.emailVerified;
    print(isEmailVerified);

    super.initState();

    if (!Provider.of<LoginProvider>(context, listen: false).checkEmail) {
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    Provider.of<LoginProvider>(context, listen: false).checkEmail =
        FirebaseAuth.instance.currentUser!.emailVerified;
    setState(() {});
    if (Provider.of<LoginProvider>(context, listen: false).checkEmail) {
      timer?.cancel();
    }
  } //////////////////////////

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<LoginProvider>(context, listen: false).checkEmail == true
        ? SignIn()
        : Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
                backgroundColor: colorPrimary,
                title: const Text("Email Verification",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text("Email Verification ",
                        fontSize: textSizeLarge, fontWeight: FontWeight.w500)
                    .paddingTop(spacing_twinty),
                text(
                    "We Sent a Verification link to Your email address Please check your email to verify your account ",
                    maxLine: 5,
                    fontSize: textSizeSMedium),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      sendVerificationEmail();
                    },
                    child: text("Resend Verification",
                            textColor: colorPrimary,
                            maxLine: 5,
                            fontWeight: FontWeight.w500,
                            fontSize: textSizeSMedium)
                        .paddingTop(spacing_xxLarge),
                  ),
                ),
                elevatedButton(
                  context,
                  width: double.infinity,
                  widget: text("GO to Login ", textColor: whiteColor),
                  onPress: () {
                    SignIn().launch(context);
                  },
                ).paddingTop(spacing_standard),
              ],
            ).paddingSymmetric(horizontal: spacing_standard_new),
          );
    //   },
    // );
  }
}
