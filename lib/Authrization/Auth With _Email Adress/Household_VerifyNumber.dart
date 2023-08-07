// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:household/Authrization/Auth%20With%20_Email%20Adress/Household_ChangePassword.dart';
// import 'package:household/utils/Constant.dart';
// import 'package:household/utils/Strings.dart';
// import 'package:household/utils/Widget.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../utils/Colors.dart';

// class VerifyNumber extends StatefulWidget {
//   static String tag = '/GroceryVerifyNumber';

//   @override
//   _VerifyNumberState createState() => _VerifyNumberState();
// }

// class _VerifyNumberState extends State<VerifyNumber> {
//   late Timer _timer;
//   int _start = 9;

//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     _timer = new Timer.periodic(
//       oneSec,
//       (Timer timer) => setState(
//         () {
//           if (_start < 1) {
//             timer.cancel();
//           } else {
//             _start = _start - 1;
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     startTimer();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back)),
//               text(OTP_text, fontSize: textSizeLarge, fontFamily: fontBold)
//                   .paddingTop(spacing_standard_new),
//               text(OTP_Subtitle,
//                       maxLine: 5,
//                       textColor: textColorSecondary,
//                       fontSize: textSizeLargeMedium,
//                       fontFamily: fontRegular)
//                   .paddingTop(spacing_standard_new),
//               PinEntryTextField(
//                 fieldWidth: 70.0,
//                 showFieldAsBox: true,
//                 fields: 4,
//                 fontSize: textSizeLargeMedium,
//               ).paddingTop(spacing_xlarge),
//               elevatedButton(
//                 context,
//                 onPress: () {
//                   ChangePassword().launch(context);
//                 },
//                 width: double.infinity,
//                 widget: text(OTP_Verify,
//                     textColor: Colors.white, fontFamily: fontMedium),
//               ).paddingTop(spacing_xxLarge),
//               RichText(
//                   text: TextSpan(
//                       style: TextStyle(
//                           color: blackColor,
//                           fontSize: textSizeMedium,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Poppins'),
//                       text: OTP_DidntCode,
//                       children: [
//                     TextSpan(
//                         text: OTP_Resend,
//                         style: TextStyle(
//                             color: colorPrimary, fontFamily: 'Poppins'))
//                   ])).center().paddingTop(spacingBig)
//             ],
//           ).paddingSymmetric(horizontal: spacing_twinty),
//         ),
//       ),
//     );
//   }
// }
