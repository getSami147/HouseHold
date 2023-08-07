import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/Household%20User%20Side/Household_Help_FAQs.dart';
import 'package:household/Household%20User%20Side/Household_PrivacyPolicy.dart';
import 'package:household/Household%20User%20Side/Household_Trem&Condition.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Widget.dart';
import 'Household_Contect US .dart';
import 'Household_Drawer.dart';
import 'Household_NotificationFull.dart';
import 'Household_ProfilePage.dart';
import 'Household_WelcomePage.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var mediaQuary = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: text(NavBar_Account,
            fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<DocumentSnapshot>(
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
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          SingleChildScrollView(
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
        ],
      ),
    );
  }
}
