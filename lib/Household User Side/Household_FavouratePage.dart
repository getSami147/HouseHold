import 'package:flutter/material.dart';
import 'package:household/model/ServiesModel.dart';
import 'package:household/utils/Images.dart';
import 'package:household/utils/Widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../State Management/FavorateServicesProvider.dart';
import '../utils/Colors.dart';
import '../utils/Constant.dart';

class FavouratePage extends StatefulWidget {
  const FavouratePage({super.key});

  @override
  State<FavouratePage> createState() => _FavouratePageState();
}

class _FavouratePageState extends State<FavouratePage> {
  @override
  Widget build(BuildContext context) {
    print("Build All Widgets");
    final provider =
        Provider.of<FavorateServiceProvider>(context, listen: false);
    setStatusBarColor(colorPrimary);
    return Scaffold(
      appBar: appBarProperty(context,
          title: text("Favorite Technicains",
              fontSize: textSizeLargeMedium,
              fontWeight: FontWeight.w500,
              textColor: whiteColor),
          backgroundColor: colorPrimary),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            itemCount: provider.selecteItems.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: spacing_standard_new,
                    vertical: spacing_standard_new),
                decoration: BoxDecoration(
                    color: filedColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            servicesModel[index].providerImage.toString(),
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
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
                                  icon: value.selecteItems.contains(index)
                                      ? Icon(
                                          Icons.favorite,
                                          color: redColor,
                                        )
                                      : Icon(Icons.favorite_border),
                                  iconSize: 20,
                                  onPressed: () {
                                    if (value.selecteItems.contains(index)) {
                                      provider.setRemoveFavourate(index);
                                    } else {
                                      provider.setAddFavourate(index);
                                    }
                                  })).paddingOnly(
                              bottom: spacing_standard, left: spacing_standard),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(servicesModel[index].providername.toString(),
                            fontWeight: FontWeight.w500,
                            fontSize: textSizeLargeMedium),
                        text(servicesModel[index].providerServies.toString(),
                            textColor: textGreyColor,
                            fontSize: textSizeSMedium),
                        text(servicesModel[index].ProviderAddress.toString(),
                                textColor: blackColor, fontSize: textSizeMedium)
                            .paddingTop(spacing_middle),
                        Row(children: [
                          Image.asset(
                            whatsappIcon,
                            height: 35,
                            width: 35,
                            fit: BoxFit.cover,
                          ),
                          text(servicesModel[index].ProvidePhoneNo.toString(),
                              textColor: blackColor, fontSize: textSizeMedium),
                        ]),
                      ],
                    ).paddingLeft(spacing_standard_new),
                  ],
                ),
              ).paddingTop(spacing_middle);
            },
          )
        ]).paddingSymmetric(horizontal: spacing_large),
      ),
    );
  }
}
