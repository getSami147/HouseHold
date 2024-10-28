import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Strings.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Household_QuestionAnswar.dart';

class Help_FAQs extends StatefulWidget {
  const Help_FAQs({Key? key}) : super(key: key);

  @override
  State<Help_FAQs> createState() => _Help_FAQsState();
}

class _Help_FAQsState extends State<Help_FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProperty(context, action: []),
      body: SingleChildScrollView(
        child: TremHelpCondition(
          pageTile: HelpFAQ_HelpsFAQs,
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: EdgeInsets.all(0),
                    backgroundColor: blackColor.withOpacity(.02),
                    child: QuestionAnswar(),
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                  color: colorPrimary.withOpacity(0.1),
                  borderRadius: BorderRadiusDirectional.circular(4)),
              child: text(HelpFAQ_AskQuestion,
                  textColor: colorPrimary,
                  fontSize: textSizeSmall,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ).paddingSymmetric(horizontal: spacing_large),
      ),
    );
  }
}

// ignore: must_be_immutable
class TremHelpCondition extends StatelessWidget {
  Widget? trailing;
  String? pageTile;
  TremHelpCondition({Key? key, this.pageTile, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: text(pageTile,
              fontSize: textSizeNormal, fontWeight: FontWeight.w500),
          subtitle: text(HelpFAQ_Subtitle,
              fontSize: textSizeSmall, textColor: colorPrimary),
          trailing: trailing,
        ),
        ExpansionTile(
          initiallyExpanded: true,
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_ChatMessenger,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          children: [
            text(
              HelpFAQ_Detail,
              maxLine: 10,
              fontSize: textSizeSMedium,
            ),
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_SecurityProcess,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          subtitle: text('On boarding etc',
              fontSize: textSizeSmall, textColor: colorPrimary),
          children: [],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_Encryption,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          subtitle: text('On boarding etc',
              fontSize: textSizeSmall, textColor: colorPrimary),
          children: [],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_Decryption,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          subtitle: text('On boarding etc',
              fontSize: textSizeSmall, textColor: colorPrimary),
          children: [],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_MediaPlayer,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          subtitle: text('On boarding etc',
              fontSize: textSizeSmall, textColor: colorPrimary),
          children: [
            text(
              HelpFAQ_Detail,
              maxLine: 10,
              fontSize: textSizeSMedium,
            ),
          ],
        ),
        ExpansionTile(
          initiallyExpanded: true,
          tilePadding: EdgeInsets.all(0),
          title: text(HelpFAQ_OurServices,
              fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
          subtitle: text('On boarding etc',
              fontSize: textSizeSmall, textColor: colorPrimary),
          children: [
            text(
              HelpFAQ_Detail,
              maxLine: 10,
              fontSize: textSizeSMedium,
            ),
          ],
        ),
      ],
    );
  }
}
