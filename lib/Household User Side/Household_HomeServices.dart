// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:household/State%20Management/FavorateServicesProvider.dart';
import 'package:household/model/ServiesModel.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../utils/Colors.dart';
import 'Household_HomeServicesBook.dart';

// ignore: must_be_immutable
class HomeServices extends StatefulWidget {
  var serviceName;

  HomeServices({
    super.key,
    required this.serviceName,
  });

  @override
  State<HomeServices> createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Stream<QuerySnapshot> getTechincains() {
      return firestore
          .collection('technicians')
          .where('roleJob', isEqualTo: widget.serviceName.toString())
          .snapshots();
    }

    final provider =
        Provider.of<FavorateServiceProvider>(context, listen: false);
    setStatusBarColor(colorPrimary);

    return Scaffold(
      appBar: appBarProperty(context,
          backgroundColor: colorPrimary,
          backbuttonColor: whiteColor,
          titleCentre: true,
          action: [],
          title: text(widget.serviceName.toString(),
              textColor: whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: textSizeLargeMedium)),
      body: StreamBuilder<QuerySnapshot>(
          stream: getTechincains(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(children: [
                  ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: spacing_standard_new,
                            vertical: spacing_standard_new),
                        decoration: BoxDecoration(
                            color: filedColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                GestureDetector(
                                  child: Hero(
                                    tag: 'imageTag',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: snapshot.hasError
                                          ? Container(
                                              height: 120,
                                              width: 100,
                                            )
                                          : Image.network(
                                              snapshot.data!.docs[index]
                                                  .get('Technision Image')
                                                  .toString(),
                                              height: 120,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  onTap: () {
                                    Scaffold(
                                      body: SafeArea(
                                        child: Stack(
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Hero(
                                                    tag: 'imageTag',
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft:
                                                                  radiusCircular(
                                                                      15),
                                                              bottomRight:
                                                                  radiusCircular(
                                                                      15)),
                                                      child: Image.network(
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get(
                                                                'Technision Image')
                                                            .toString(),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .9,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  HomeServiceBook(
                                                    TechnicainsName: snapshot
                                                        .data!.docs[index]
                                                        .get('name'),
                                                    email: snapshot
                                                        .data!.docs[index]
                                                        .get('email'),
                                                    TechnicainsJobrole: snapshot
                                                        .data!.docs[index]
                                                        .get('roleJob'),
                                                    TechnicainsAddress: snapshot
                                                        .data!.docs[index]
                                                        .get('address'),
                                                    TechnicainsPhonNo: snapshot
                                                        .data!.docs[index]
                                                        .get('number'),
                                                    TechnicainsDescription:
                                                        snapshot
                                                            .data!.docs[index]
                                                            .get('description'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back,
                                                  color: whiteColor,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ).launch(context);
                                  },
                                ),
                                Consumer<FavorateServiceProvider>(
                                  builder: (context, value, child) => Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor,
                                      ),
                                      child: IconButton(
                                          icon:
                                              value.selecteItems.contains(index)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: redColor,
                                                    )
                                                  : Icon(Icons.favorite_border),
                                          iconSize: 20,
                                          onPressed: () {
                                            if (value.selecteItems
                                                .contains(index)) {
                                              provider
                                                  .setRemoveFavourate(index);
                                            } else {
                                              provider.setAddFavourate(index);
                                            }
                                          })).paddingOnly(
                                      bottom: spacing_standard,
                                      left: spacing_standard),
                                )
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  text(snapshot.data!.docs[index].get('name'),
                                      fontWeight: FontWeight.w500,
                                      fontSize: textSizeLargeMedium),
                                  text(
                                      snapshot.data!.docs[index].get('roleJob'),
                                      textColor: textGreyColor,
                                      fontSize: textSizeSMedium),
                                  text(
                                          snapshot.data!.docs[index]
                                              .get('address'),
                                          textColor: blackColor,
                                          maxLine: 4,
                                          fontSize: textSizeMedium)
                                      .paddingTop(spacing_middle),
                                  Row(children: [
                                    Image.asset(
                                      whatsappIcon,
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover,
                                    ),
                                    text(
                                        snapshot.data!.docs[index]
                                            .get('number'),
                                        textColor: blackColor,
                                        fontSize: textSizeMedium),
                                  ]),
                                ],
                              ).paddingLeft(spacing_standard_new),
                            ),
                          ],
                        ),
                      ).paddingTop(spacing_middle);
                    },
                  )
                ]).paddingSymmetric(horizontal: spacing_standard_new),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: colorPrimary,
              ));
            }
          }),
    );
  }
}
