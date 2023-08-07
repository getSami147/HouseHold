import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/Household_SignIn.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/Widget.dart';

class ForgotPassword extends StatefulWidget {
  static String tag = '/GroceryForgotPassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool islooding = false;
  @override
  Widget build(BuildContext context) {
    final ForgotemailController = TextEditingController();
    final auth = FirebaseAuth.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    text(ForgotPassword_text,
                            fontSize: textSizeLarge, fontFamily: fontBold)
                        .paddingOnly(
                            top: spacing_standard_new,
                            right: spacing_standard_new),
                    text(
                      ForgotPassword_subtitle,
                      maxLine: 5,
                      textColor: textColorSecondary,
                      fontSize: textSizeMedium,
                    ).paddingTop(spacing_twinty),
                    SizedBox(height: spacing_standard_new),
                    textformfield(
                      // keyboardType: TextInputType.emailAddress,
                      controller: ForgotemailController,
                      obscureText: false,
                      hinttext: SignUp_Email_Address,
                      prefixIcons: Icon(Icons.email_outlined),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is Required';
                        } else if (!value.contains('@')) {
                          return "Enter a Valid Email,'@ 'is Required";
                        }
                        return null;
                      },
                    ).paddingTop(spacing_standard_new),
                    elevatedButton(
                      context,
                      looding: islooding,
                      onPress: () {
                        setState(() {
                          islooding = true;
                        });
                        auth
                            .sendPasswordResetEmail(
                                email: ForgotemailController.text
                                    .toString()
                                    .trim())
                            .then((value) {
                          setState(() {
                            islooding = false;
                          });

                          utils().toastMethod(
                              'We Have Sent Email Verification Code to your Email please check and Change your Password');
                        }).onError((error, stackTrace) {
                          setState(() {
                            islooding = false;
                          });
                          utils().toastMethod(error.toString());
                        });
                      },
                      width: double.infinity,
                      widget: text(ForgotPassword_SendCode,
                          textColor: Colors.white, fontFamily: fontMedium),
                    ).paddingTop(spacing_xlarge),
                  ],
                ).paddingSymmetric(horizontal: spacing_twinty),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ));
            },
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: blackColor,
                        fontSize: textSizeMedium,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                    text: ForgotPassword_Rememberpass,
                    children: [
                  TextSpan(
                      text: ForgotPassword_Login,
                      style:
                          TextStyle(color: colorPrimary, fontFamily: 'Poppins'))
                ])).center().paddingBottom(spacing_twinty),
          )
        ],
      ),
    );
  }
}
