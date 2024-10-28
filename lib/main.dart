import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:household/Household%20Technician%20Side/TechnisionSide.dart';
import 'package:household/Household%20User%20Side/Household_Dashboard.dart';
import 'package:household/Household%20User%20Side/Household_Splash.dart';
import 'package:household/State%20Management/FavorateServicesProvider.dart';
import 'package:household/store/AppStore.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/DataGenerator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'State Management/Sign In Provider.dart';
import 'locale/AppLocalizations.dart';

import 'locale/Languages.dart';

AppStore appStore = AppStore();
BaseLanguage? language;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initialize(aLocaleLanguageList: languageList());
  await appStore.setLanguage(
      getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage));

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

String? role;
Future<bool> checkLoginStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? value = await prefs.getString("uid");
  role = await prefs.getString("role");

  if (value == null || role == null) {
    return false;
  }
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavorateServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Household${!isMobile ? ' ${platformName()}' : ''}',
        home: FutureBuilder(
            future: checkLoginStatus(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == true) {
                return role == 'User Side'
                    ? Dashboard()
                    : TechnisionSide(name: role);
              } else {
                return SplashScreen();
              }
            }),
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
      ),
    );
  }
}
