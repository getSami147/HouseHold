import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:household/Household%20User%20Side/Household_HomePage.dart';
import 'package:household/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/Strings.dart';
import '../utils/Constant.dart';
import '../utils/Images.dart';
import '../utils/Widget.dart';
import 'Household_SearchPage.dart';
import 'Household_AccountPage.dart';
import 'Household_Bookingpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  List pages = [HomePage(), SearchPage(), Bookingpage(), AccountPage()];
  List<String> navBarIcons = [
    Navigation_ic_Home,
    Navigation_ic_Search,
    Navigation_ic_map,
    Navigation_ic_Profile,
  ];

  List<Widget> navText = [
    text(NavBar_Home, fontSize: textSizeSmall),
    text(NavBar_Search, fontSize: textSizeSmall),
    text(NavBar_Booking, fontSize: textSizeSmall),
    text(NavBar_Account, fontSize: textSizeSmall),
  ];
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(whiteColor);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: boxDecorationDefault(),
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navBarIcons.map((e) {
              int i = navBarIcons.indexOf(e);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: radiusOnly(bottomLeft: 5, bottomRight: 5),
                    ),
                  ).visible(i == selectedIndex),
                  // Container().visible(i == selectedIndex),
                  IconButton(
                    icon: SvgPicture.asset(
                      e,
                      height: 20,
                      width: 20,
                      color: i == selectedIndex ? colorPrimary : iconGrey_color,
                    ),
                    onPressed: () {
                      selectedIndex = i;
                      setState(() {});
                    },
                  ),
                  navText[i]
                ],
              );
            }).toList()),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: PageView(
          children: [pages[selectedIndex]],
        ),
      ),
    );
  }
}
