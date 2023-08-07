import 'package:flutter/material.dart';
import 'package:household/model/Home_model.dart';
import 'package:household/Household%20User%20Side/Household_Drawer.dart';
import 'package:household/Household%20User%20Side/Household_HomeServices.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Household_Home Construction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isenable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerpage(),
      // Drawer page is called .......................................
      appBar: appBarProperty(
        context,
        showback: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textformfield(
              obscureText: false,
              hinttext: Home_Search,
              suffixIcons: Icon(Icons.search).paddingRight(spacing_middle),
            ).paddingOnly(
                top: spacing_middle, left: spacing_large, right: spacing_large),
            HorizontalList(
              itemCount: homebannerModel.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    homebannerModel[index].serviceIcon.toString(),
                    height: MediaQuery.of(context).size.width * 0.42,
                    width: MediaQuery.of(context).size.width * 0.89,
                    fit: BoxFit.cover,
                  ),
                ).paddingOnly(top: spacing_twinty, left: spacing_middle);
              },
            ),
            ViewAll(
              leadigtext: Home_HomeSerives,
              traillingtext: Home_ViewAll,
            ).paddingOnly(
                top: spacing_twinty, left: spacing_large, right: spacing_large),
            HorizontalList(
              spacing: 20,
              itemCount: homeServicesModel.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    HomeServices(
                      serviceName: homeServicesModel[index].serviceName,
                    ).launch(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: filedColor, shape: BoxShape.circle),
                        child: homeServicesModel[index].serviceIcon,
                      ),
                      text(
                        homeServicesModel[index].serviceName,
                        fontSize: textSizeSmall,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              },
            ).paddingLeft(spacing_standard_new),
            ViewAll(
              leadigtext: Home_HomeConstruction,
              traillingtext: Home_ViewAll,
            ).paddingOnly(
                top: spacing_twinty, left: spacing_large, right: spacing_large),
            HorizontalList(
              spacing: 20,
              itemCount: homeConstructionModel.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    HomeConstruction(
                      serviceName: homeConstructionModel[index].serviceName,
                    ).launch(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: filedColor, shape: BoxShape.circle),
                        child: homeConstructionModel[index].serviceIcon,
                      ),
                      text(
                        homeConstructionModel[index].serviceName,
                        fontSize: textSizeSmall,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                );
              },
            ).paddingLeft(spacing_standard_new),
            ViewAll(
              leadigtext: Home_PupularServies,
              traillingtext: Home_ViewAll,
            ).paddingOnly(
                top: spacing_twinty, left: spacing_large, right: spacing_large),
            HorizontalList(
              spacing: 20,
              itemCount: homePapularModel.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    homePapularModel[index].serviceIcon.toString(),
                    height: 130,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).paddingLeft(spacing_standard_new),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewAll extends StatelessWidget {
  String? leadigtext;
  String? traillingtext;
  ViewAll({Key? key, this.leadigtext, this.traillingtext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(leadigtext, fontSize: textSizeMedium, fontWeight: FontWeight.w600),
        text(traillingtext,
            fontSize: textSizeSmall,
            fontWeight: FontWeight.w500,
            textColor: colorPrimary),
      ],
    );
  }
}
