import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:household/Household%20User%20Side/Household_NotificationFull.dart';
import 'package:household/Household%20User%20Side/Household_Help_FAQs.dart';
import 'package:household/Household%20User%20Side/Household_PrivacyPolicy.dart';
import 'package:household/Household%20User%20Side/Household_ProfilePage.dart';
import 'package:household/Household%20User%20Side/Household_Trem&Condition.dart';
import 'package:household/Household%20User%20Side/Household_WelcomePage.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/Constant.dart';
import '../utils/Widget.dart';
import 'Household_Contect US .dart';

class Drawerpage extends StatelessWidget {
  const Drawerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Drawer(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: ClipOval(
                          child: Image.network(
                        snapshot.data!['userImage'],
                        height: mediaQuary.width * .25,
                        width: mediaQuary.width * .25,
                        fit: BoxFit.cover,
                      )),
                      backgroundColor: colorPrimary,
                    ).paddingTop(spacing_twinty),
                    text(snapshot.data!['username'].toString(),
                            fontSize: textSizeLargeMedium,
                            fontWeight: FontWeight.w600)
                        .paddingTop(spacing_middle),
                    text(snapshot.data!['email'].toString(),
                        fontSize: 11.0, textColor: textGreyColor),
                  ],
                );
              } else {
                return CircleAvatar(
                  radius: 50,
                  backgroundColor: blackColor,
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buid_Drawer_Label(
                    onpress: () {
                      ProfilePage().launch(context);
                    },
                    Imagename: Drawer_ic_Profile,
                    TextName: Drawer_MyProfile,
                  ),
                  buid_Drawer_Label(
                    Imagename: Drawer_ic_Massage,
                    TextName: Drawer_MyFavourate,
                  ),
                  buid_Drawer_Label(
                    onpress: () {
                      NotificationFull().launch(context);
                    },
                    Imagename: Drawer_ic_Notification,
                    TextName: Drawer_Notifications,
                  ),
                  buid_Drawer_Label(
                    onpress: () {
                      ContectUs().launch(context);
                    },
                    Imagename: Drawer_ic_Notification,
                    TextName: Drawer_ContactUs,
                  ),
                  buid_Drawer_Label(
                    Imagename: Drawer_ic_Privacy,
                    TextName: Drawer_PrivacyPolicy,
                    onpress: () {
                      PrivacyPolicy().launch(context);
                    },
                  ),
                  buid_Drawer_Label(
                    Imagename: Drawer_ic_TremCondition,
                    TextName: Drawer_TermsConditions,
                    onpress: () {
                      TremCondition().launch(context);
                    },
                  ),
                  buid_Drawer_Label(
                    Imagename: Drawer_ic_Help,
                    TextName: Drawer_HelpsFAQs,
                    onpress: () {
                      Help_FAQs().launch(context);
                    },
                  ),
                  buid_Drawer_Label(
                    Imagename: Drawer_ic_logOut,
                    TextName: Drawer_SignOut,
                    onpress: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("uid");

                      welcomePage().launch(context, isNewTask: true);
                    },
                  ),
                ],
              ).paddingLeft(spacing_thirty),
            ),
          )
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class buid_Drawer_Label extends StatelessWidget {
  IconData? iconA;
  String? Imagename;
  String? TextName;
  VoidCallback? onpress;

  buid_Drawer_Label(
      {Key? key, this.Imagename, this.TextName, this.iconA, this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                Imagename.toString(),
                height: 25,
                width: 25,
                fit: BoxFit.contain,
              ),
            ],
          ),
          text(TextName, fontFamily: 'Poppins')
              .paddingLeft(spacing_standard_new),
          Icon(
            iconA,
            size: 20,
          ).paddingOnly(left: spacing_control, top: spacing_control),
        ],
      ).paddingOnly(top: spacing_xlarge),
    );
  }
}
