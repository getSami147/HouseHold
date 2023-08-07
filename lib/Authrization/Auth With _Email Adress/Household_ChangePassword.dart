// import 'package:flutter/material.dart';
// import 'package:household/Authrization/Auth%20With%20_Email%20Adress/Household_SuccessfulVerify.dart';
// import 'package:household/main.dart';
// import 'package:household/utils/Colors.dart';
// import 'package:household/utils/Strings.dart';

// import 'package:nb_utils/nb_utils.dart';
// import '../../utils/Constant.dart';
// import '../../utils/Widget.dart';

// class ChangePassword extends StatefulWidget {
//   static String tag = '/GroceryChangePassword';

//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   @override
//   void initState() {
//     super.initState();
//     changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     changeStatusColor(colorPrimary);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
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
//               text(NewPassword_Title,
//                       fontSize: textSizeLarge, fontFamily: fontBold)
//                   .paddingOnly(
//                       top: spacing_standard_new, right: spacing_standard_new),
//               text(
//                 NewPassword_SubTitle,
//                 maxLine: 5,
//                 textColor: textColorSecondary,
//                 fontSize: textSizeMedium,
//               ).paddingTop(spacing_twinty),
//               SizedBox(height: spacing_standard_new),
//               formField(
//                 context,
//                 NewPassword_NewPassword,
//                 textInputAction: TextInputAction.next,
//               ).paddingBottom(spacing_standard_new),
//               formField(
//                 context,
//                 NewPassword_ConfirmPassword,
//                 textInputAction: TextInputAction.next,
//               ).paddingBottom(spacing_standard_new),
//               elevatedButton(
//                 context,
//                 onPress: () {
//                   SuccessfulVerify().launch(context);
//                 },
//                 width: double.infinity,
//                 widget: text(NewPassword_ResetPassword,
//                     textColor: Colors.white, fontFamily: fontMedium),
//               ).paddingTop(spacing_xxLarge),
//             ],
//           ).paddingSymmetric(horizontal: spacing_twinty),
//         ),
//       ),
//     );
//   }
// }
