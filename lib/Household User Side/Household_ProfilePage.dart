import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    var mediaQuary = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarWidget('',
          elevation: 0,
          center: true,
          titleWidget: text(Profile_MyProfile,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
                      future: users
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
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
                                  Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                        onPressed: () {
                                          // ImagePicking(imageUrl:imageUrl = '';);
                                        },
                                        icon: Icon(Icons.camera_alt_outlined),
                                        color: whiteColor,
                                        iconSize: 20,
                                      )).paddingTop(spacing_middle),
                                ],
                              ),
                              FieldConatiner(
                                      mediaQuary: mediaQuary,
                                      title:
                                          snapshot.data!['username'].toString())
                                  .paddingTop(spacing_twinty),
                              FieldConatiner(
                                      mediaQuary: mediaQuary,
                                      title: snapshot.data!['email'].toString())
                                  .paddingTop(spacing_twinty),
                            ],
                          );
                        } else {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: blackColor,
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [],
                      ).paddingLeft(spacing_thirty),
                    )
                  ],
                ).paddingSymmetric(horizontal: spacing_large),
              ),
            ),
            elevatedButton(
              context,
              borderRadius: 20.0,
              height: 50.0,
              width: double.infinity,
              onPress: () {},
              widget: text(Profile_Save, textColor: whiteColor),
            ).paddingOnly(
                bottom: spacing_twinty,
                left: spacing_large,
                right: spacing_large),
          ],
        ),
      ),
    );
  }

  Container FieldConatiner({required Size mediaQuary, title}) {
    return Container(
      alignment: Alignment.centerLeft,
      height: mediaQuary.width * .13,
      width: mediaQuary.width,
      decoration: BoxDecoration(
          color: iconGrey_color, borderRadius: BorderRadius.circular(15)),
      child: text(
        title.toString(),
      ).paddingLeft(spacing_middle),
    );
  }
}
