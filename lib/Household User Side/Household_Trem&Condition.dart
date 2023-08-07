import 'package:flutter/material.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/Widget.dart';
import 'Household_Help_FAQs.dart';

class TremCondition extends StatelessWidget {
  const TremCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProperty(context, action: []),
      body: SingleChildScrollView(
        child: TremHelpCondition(
          pageTile: HelpFAQ_TermsConditions,
        ).paddingSymmetric(horizontal: spacing_large),
      ),
    );
  }
}
