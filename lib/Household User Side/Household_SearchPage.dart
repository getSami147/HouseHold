import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Household_HomeServicesBook.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchContoller = TextEditingController();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    Stream<QuerySnapshot> getTechincains() {
      return firestore.collection('technicians').snapshots();
    }

    setStatusBarColor(colorPrimary);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorPrimary,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: text(NavBar_Search,
              fontSize: textSizeLargeMedium,
              fontWeight: FontWeight.w500,
              textColor: whiteColor)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textformfield(
              onChanged: (value) {},
              controller: searchContoller,
              obscureText: false,
              hinttext: Home_Search,
              suffixIcons: Icon(Icons.search).paddingRight(spacing_middle),
            ).paddingOnly(
                top: spacing_middle, left: spacing_large, right: spacing_large),
            StreamBuilder<QuerySnapshot>(
                stream: getTechincains(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        child: Column(children: [
                      ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String rolejob =
                              snapshot.data!.docs[index].get('roleJob');
                          if (searchContoller.text.isEmpty) {
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
                                          tag: 'heroImage',
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Hero(
                                                          tag: 'heroImage',
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        radiusCircular(
                                                                            15),
                                                                    bottomRight:
                                                                        radiusCircular(
                                                                            15)),
                                                            child:
                                                                Image.network(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'Technision Image')
                                                                  .toString(),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .9,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        HomeServiceBook(
                                                          TechnicainsName:
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get('name'),
                                                          email: snapshot
                                                              .data!.docs[index]
                                                              .get('email'),
                                                          TechnicainsJobrole:
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'roleJob'),
                                                          TechnicainsAddress:
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'address'),
                                                          TechnicainsPhonNo:
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'number'),
                                                          TechnicainsDescription:
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'description'),
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
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        text(
                                            snapshot.data!.docs[index]
                                                .get('name'),
                                            fontWeight: FontWeight.w500,
                                            fontSize: textSizeLargeMedium),
                                        text(
                                            snapshot.data!.docs[index]
                                                .get('roleJob'),
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
                          } else if (rolejob.toLowerCase().contains(
                                  searchContoller.text.toLowerCase()) ||
                              rolejob.toUpperCase().contains(
                                  searchContoller.text.toUpperCase())) {
                            return ListTile(
                              leading: Image.network(
                                snapshot.data!.docs[index]
                                    .get('Technision Image')
                                    .toString(),
                                height: MediaQuery.of(context).size.width * .9,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              title: text(snapshot.data!.docs[index]
                                  .get('name')
                                  .toString()),
                              subtitle: text(snapshot.data!.docs[index]
                                  .get('roleJob')
                                  .toString()),
                            );
                            // return Container(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: spacing_standard_new,
                            //       vertical: spacing_standard_new),
                            //   decoration: BoxDecoration(
                            //       color: filedColor,
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: Row(
                            //     children: [
                            //       Stack(
                            //         alignment: Alignment.bottomLeft,
                            //         children: [
                            //           GestureDetector(
                            //             child: Hero(
                            //               tag: 'heroImage',
                            //               child: ClipRRect(
                            //                 borderRadius:
                            //                     BorderRadius.circular(10),
                            //                 child: snapshot.hasError
                            //                     ? Container(
                            //                         height: 120,
                            //                         width: 100,
                            //                       )
                            //                     : Image.network(
                            //                         snapshot.data!.docs[index]
                            //                             .get('Technision Image')
                            //                             .toString(),
                            //                         height: 120,
                            //                         width: 100,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //               ),
                            //             ),
                            //             onTap: () {
                            //               Scaffold(
                            //                 body: SafeArea(
                            //                   child: Stack(
                            //                     children: [
                            //                       SingleChildScrollView(
                            //                         child: Column(
                            //                           crossAxisAlignment:
                            //                               CrossAxisAlignment
                            //                                   .start,
                            //                           children: [
                            //                             Hero(
                            //                               tag: 'heroImage',
                            //                               child: ClipRRect(
                            //                                 borderRadius:
                            //                                     BorderRadius.only(
                            //                                         bottomLeft:
                            //                                             radiusCircular(
                            //                                                 15),
                            //                                         bottomRight:
                            //                                             radiusCircular(
                            //                                                 15)),
                            //                                 child:
                            //                                     Image.network(
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get(
                            //                                           'Technision Image')
                            //                                       .toString(),
                            //                                   height: MediaQuery.of(
                            //                                               context)
                            //                                           .size
                            //                                           .width *
                            //                                       .9,
                            //                                   width:
                            //                                       MediaQuery.of(
                            //                                               context)
                            //                                           .size
                            //                                           .width,
                            //                                   fit: BoxFit.cover,
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                             HomeServiceBook(
                            //                               TechnicainsName:
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get('name'),
                            //                               TechnicainsJobrole:
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get(
                            //                                           'roleJob'),
                            //                               TechnicainsAddress:
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get(
                            //                                           'address'),
                            //                               TechnicainsPhonNo:
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get(
                            //                                           'number'),
                            //                               TechnicainsDescription:
                            //                                   snapshot.data!
                            //                                       .docs[index]
                            //                                       .get(
                            //                                           'description'),
                            //                             )
                            //                           ],
                            //                         ),
                            //                       ),
                            //                       IconButton(
                            //                           onPressed: () {
                            //                             Navigator.pop(context);
                            //                           },
                            //                           icon: Icon(
                            //                             Icons.arrow_back,
                            //                             color: whiteColor,
                            //                           ))
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ).launch(context);
                            //             },
                            //           ),
                            //         ],
                            //       ),
                            //       Expanded(
                            //         child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             text(
                            //                 snapshot.data!.docs[index]
                            //                     .get('name'),
                            //                 fontWeight: FontWeight.w500,
                            //                 fontSize: textSizeLargeMedium),
                            //             text(
                            //                 snapshot.data!.docs[index]
                            //                     .get('roleJob'),
                            //                 textColor: textGreyColor,
                            //                 fontSize: textSizeSMedium),
                            //             text(
                            //                     snapshot.data!.docs[index]
                            //                         .get('address'),
                            //                     textColor: blackColor,
                            //                     maxLine: 4,
                            //                     fontSize: textSizeMedium)
                            //                 .paddingTop(spacing_middle),
                            //             Row(children: [
                            //               Image.asset(
                            //                 whatsappIcon,
                            //                 height: 35,
                            //                 width: 35,
                            //                 fit: BoxFit.cover,
                            //               ),
                            //               text(
                            //                   snapshot.data!.docs[index]
                            //                       .get('number'),
                            //                   textColor: blackColor,
                            //                   fontSize: textSizeMedium),
                            //             ]),
                            //           ],
                            //         ).paddingLeft(spacing_standard_new),
                            //       ),
                            //     ],
                            //   ),
                            // ).paddingTop(spacing_middle);

                          } else {
                            return Center(
                                child: text('else', fontSize: textSizeLarge));
                          }
                        },
                      )
                    ])
                        // .paddingSymmetric(horizontal: spacing_standard_new),
                        );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: colorPrimary,
                    ));
                  }
                }),
          ],
        ).paddingSymmetric(horizontal: spacing_large),
      ),
    );
  }
}
