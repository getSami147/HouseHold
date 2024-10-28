import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With_PhoneNumber/Household_PhoneLogIn.dart';
import 'package:household/Household%20Technician%20Side/TechnisionSide.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/Household%20User%20Side/Household_Dashboard.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../State Management/Sign In Provider.dart';
import '../../utils/Strings.dart';
import 'Household_ForgotPassword.dart';
import 'Household_SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLooding = false;
  var passwordVisible = true;
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  Timer? timer;

  sendEmailVerification(currentUser) async {
    Provider.of<LoginProvider>(context, listen: false).checkEmail = currentUser;
    if (!Provider.of<LoginProvider>(context, listen: false).checkEmail) {
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    Provider.of<LoginProvider>(context, listen: false).checkEmail =
        FirebaseAuth.instance.currentUser!.emailVerified;
    setState(() {});
    if (Provider.of<LoginProvider>(context, listen: false).checkEmail) {
      timer?.cancel();
      Fluttertoast.showToast(msg: "email verified succefssfully login again");
    }
  } //////////////////////////

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final prvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget('', elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(
                      LogIn_Welcomeback,
                      fontSize: textSizeLarge,
                      fontWeight: FontWeight.w500,
                      maxLine: 5,
                    ).paddingOnly(top: spacing_xxLarge, right: spacingBig),
                    Form(
                      key: _formKey,
                      child: Consumer<LoginProvider>(
                        builder: (context, Consumervalue, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textformfield(
                              controller: emailController,
                              obscureText: false,
                              hinttext: LogIn_email,
                              prefixIcons: Icon(
                                Icons.email_outlined,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is Required';
                                } else if (!value.contains('@')) {
                                  return "Enter a Valid Email,'@ 'is Required";
                                }
                                return null;
                              },
                            ).paddingBottom(spacing_standard_new),
                            textformfield(
                              controller: PasswordController,
                              hinttext: LogIn_password,
                              obscureText: prvider.passwordObsecure,
                              prefixIcons: Icon(Icons.lock_outlined),
                              suffixIcons: IconButton(
                                  onPressed: () {
                                    prvider.setIconChange();
                                  },
                                  icon: Consumervalue.passwordObsecure
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: colorPrimary,
                                        )
                                      : Icon(Icons.visibility)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is Required';
                                }
                                return null;
                              },
                            ).paddingTop(spacing_twinty),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                        onPressed: () {
                                          ForgotPassword().launch(context);
                                        },
                                        child: text(LogIn_Forgot,
                                            fontSize: textSizeSMedium,
                                            textColor: colorPrimary))
                                    .paddingTop(spacing_middle)
                              ],
                            ),
                            Consumer<LoginProvider>(
                              builder: (context, roleValue, child) {
                                return elevatedButton(
                                  context,
                                  looding: isLooding,
                                  onPress: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLooding = true;
                                      });
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: emailController.text
                                                  .toString()
                                                  .trim(),
                                              password: PasswordController.text
                                                  .toString()
                                                  .trim())
                                          .then((documentSnapshot) async {
                                            print(documentSnapshot);
                                        setState(() {
                                          isLooding = false;
                                        });
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString(
                                            "uid", documentSnapshot.user!.uid);
                                        prvider.checkEmail = documentSnapshot
                                            .user!.emailVerified;

                                        if (prvider.checkEmail == false) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please verify your email go to Your Gmail");
                                          sendEmailVerification(documentSnapshot
                                              .user!.emailVerified);
                                        } else {
                                          User? currenuser = await FirebaseAuth
                                              .instance.currentUser;
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(currenuser!.uid)
                                              .get()
                                              .then((DocumentSnapshot
                                                  documentSnapshot) async {
                                            if (documentSnapshot.exists) {
                                              final SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString(
                                                  "role",
                                                  documentSnapshot
                                                      .get('roles'));
                                              documentSnapshot.get('roles') ==
                                                      'User Side'
                                                  ? Dashboard().launch(context)
                                                  : TechnisionSide(
                                                      name: documentSnapshot
                                                          .get('roles'),
                                                    ).launch(context);
                                              utils().toastMethod(
                                                  'Congratulations! You have successfully logged in. Welcome ');
                                            }
                                          });
                                        }
                                      }).onError((error, stackTrace) {
                                        utils().toastMethod(error.toString());
                                        setState(() {
                                          isLooding = false;
                                        });
                                      });
                                    }
                                  },
                                  width: double.infinity,
                                  widget: text(
                                    LogIn_Login,
                                    textColor: Colors.white,
                                  ),
                                ).paddingTop(spacing_xlarge);
                              },
                            )
                          ],
                        ),
                      ),
                    ).paddingTop(spacingBig),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        text(
                          LogIn_OrLogin,
                          fontSize: textSizeSMedium,
                        )
                            .paddingSymmetric(horizontal: spacing_standard)
                            .center(),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                      ],
                    ).paddingTop(spacing_xxLarge),
                    OutlineButton(
                      radius: 20.0,
                      isStroked: true,
                      textColor: blackColor,
                      textContent: welcome_PhoneLogin,
                      bodercolor: colorPrimary,
                      onPressed: () {
                        PhoneLogIn().launch(context);
                      },
                    ).paddingTop(spacing_thirty),
                  ],
                ).paddingSymmetric(horizontal: spacing_twinty),
              ),
            ),
            TextButton(
                onPressed: () {
                  SignUp().launch(context);
                },
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: blackColor,
                          fontSize: textSizeMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        text: LogIn_DontAccount,
                        children: [
                      TextSpan(
                          text: LogIn_Register,
                          style: TextStyle(
                            color: colorPrimary,
                          ))
                    ]))).center().paddingBottom(spacing_twinty),
          ],
        ),
      ),
    );
  }
}

// void sendVerificationEmail() async {
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     try {
//       await user.sendEmailVerification();
//       // Verification email sent successfully
//     } catch (e) {
//       // Handle email sending errors
//       print('Email sending error: $e');
//     }
//   }
// }

// // Check if the email is verified
// bool isEmailVerified() {
//   User? user = FirebaseAuth.instance.currentUser;
//   return user != null && user.emailVerified;
// }
