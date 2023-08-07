import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:household/utils/Constant.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeServiceBook extends StatelessWidget {
  var serviceName;
  var email;
  var TechnicainsName;
  var TechnicainsJobrole;
  var TechnicainsAddress;
  var TechnicainsPhonNo;
  var TechnicainsDescription;

  HomeServiceBook({
    required this.TechnicainsPhonNo,
    this.TechnicainsAddress,
    this.TechnicainsJobrole,
    this.email,
    this.TechnicainsName,
    this.TechnicainsDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void openWhatsApp() async {
      var phoneNumber = TechnicainsPhonNo;
      final Uri _url =
          Uri.parse('whatsapp://send?phone=' + phoneNumber.toString());
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    void makePhoneCall() async {
      var phoneNumber = TechnicainsPhonNo;
      final Uri phoneUrl = Uri.parse('tel:' + phoneNumber.toString());
      if (!await launchUrl(phoneUrl)) throw 'Could not launch $phoneUrl ';
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Name:',
                  fontSize: textSizeLargeMedium, fontWeight: FontWeight.w500),
              text(TechnicainsName.toString(), fontWeight: FontWeight.w500),
            ],
          ).paddingTop(spacing_standard_new),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Email :', fontWeight: FontWeight.w500),
              text(
                email,
              ),
            ],
          ).paddingTop(spacing_standard_new),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Service Type:', fontWeight: FontWeight.w500),
              text(
                TechnicainsJobrole.toString(),
              ),
            ],
          ).paddingTop(spacing_standard),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text('Address:', fontWeight: FontWeight.w500),
              text(
                TechnicainsAddress.toString(),
              ),
            ],
          ).paddingTop(spacing_standard),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text("Make a Call:", fontWeight: FontWeight.w500),
              TextButton(
                onPressed: () {
                  makePhoneCall();
                },
                child: text(
                  TechnicainsPhonNo.toString(),
                  textColor: colorPrimary,
                  fontSize: textSizeMedium,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text("Whatsapp SMS:", fontWeight: FontWeight.w500),
              TextButton(
                onPressed: () {
                  openWhatsApp();
                },
                child: Image.asset(
                  whatsappIcon,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          text("Description:",
                  fontSize: textSizeNormal, fontWeight: FontWeight.w500)
              .paddingTop(spacing_standard_new),
          text(TechnicainsDescription.toString(),
                  fontSize: textSizeMedium, maxLine: 10)
              .paddingTop(spacing_standard),
        ],
      ).paddingSymmetric(horizontal: spacing_twinty),
    );
  }
}
