import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Authrization/Auth%20With_PhoneNumber/Household_NumberVerifyCode.dart';
import 'package:household/Authrization/Auth%20With%20_Email%20Adress/utils.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

class PhoneLogIn extends StatefulWidget {
  const PhoneLogIn({super.key});

  @override
  State<PhoneLogIn> createState() => _PhoneLogInState();
}

class _PhoneLogInState extends State<PhoneLogIn> {
  bool islooding = false;

  Country Selectedcountries = Country(
      phoneCode: '+92',
      countryCode: 'Pk',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Pakistan',
      example: 'Pakistan',
      displayName: 'Pakistan',
      displayNameNoCountryCode: 'Pk',
      e164Key: '');

  @override
  Widget build(BuildContext context) {
    final PhoneNumberController = TextEditingController();

    final auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarWidget('', elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('LogIn With Phone Number',
                  fontSize: textSizeNormal, fontWeight: FontWeight.w500)
              .paddingTop(spacing_standard_new),
          text("Enter the Mobile Number you will get the code by SMS.",
                  maxLine: 5,
                  textColor: textColorSecondary,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontRegular)
              .paddingTop(spacing_standard_new),
          textformfield(
            controller: PhoneNumberController,
            // keyboardType: TextInputType.number,
            obscureText: false,
            hinttext: '330-3210XXX',
            prefixIcons: TextButton(
                onPressed: () {
                  showCountryPicker(
                    searchAutofocus: true,
                    favorite: ['PK', '+92'],
                    context: context,
                    onSelect: (value) {
                      setState(() {
                        Selectedcountries = value;
                      });
                    },
                  );
                  debugPrint(Selectedcountries.phoneCode);
                },
                child: text(
                    '${Selectedcountries.flagEmoji}+${Selectedcountries.phoneCode}')),
          ).paddingTop(spacing_xxLarge),
          elevatedButton(
            context,
            looding: islooding,
            onPress: () {
              debugPrint(Selectedcountries.phoneCode);
              debugPrint(PhoneNumberController.text);
              setState(() {
                islooding = true;
              });
              auth.verifyPhoneNumber(
                phoneNumber: "+" +
                    Selectedcountries.phoneCode +
                    PhoneNumberController.text.toString().trim(),
                verificationCompleted: (phoneAuthCredential) {
                  setState(() {
                    islooding = false;
                  });
                },
                verificationFailed: (error) {
                  setState(() {
                    islooding = false;
                  });
                  utils().toastMethod(error.toString());
                },
                codeSent: (String verificationid, int? Token) {
                  NumberVerifyCode(
                    VerficationId: verificationid,
                  ).launch(context);
                  setState(() {
                    islooding = false;
                  });
                },
                codeAutoRetrievalTimeout: (e) {
                  utils().toastMethod(e.toString());
                  setState(() {
                    islooding = false;
                  });
                },
              );
            },
            width: double.infinity,
            widget: text(
              "Send Code",
              textColor: Colors.white,
            ),
          ).paddingTop(spacing_xlarge),
        ],
      ).paddingSymmetric(horizontal: spacing_twinty),
    );
  }
}
