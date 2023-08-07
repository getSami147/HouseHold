import 'package:flutter/material.dart';
import 'package:household/Household%20User%20Side/Household_Help_FAQs.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProperty(
        context,
        action: [],
      ),
      body: SingleChildScrollView(
        child: TremHelpCondition(
          pageTile: HelpFAQ_PrivacyPolicy,
        ).paddingSymmetric(horizontal: spacing_large),
      ),
    );
  }
}
