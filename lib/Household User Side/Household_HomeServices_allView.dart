// import 'package:flutter/material.dart';
// import 'package:household/model/ServiesModel.dart';
// import 'package:household/utils/Constant.dart';
// import 'package:household/utils/Images.dart';
// import 'package:household/utils/Widget.dart';
// import 'package:nb_utils/nb_utils.dart';

// class HomeServiceViewAll extends StatelessWidget {
//   const HomeServiceViewAll({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: white,
//                 )),
//             expandedHeight: 300,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.asset(
//                 HomeServiesBook_SilverAppPic,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverFillRemaining(
//             child: ListView.builder(
//               padding: EdgeInsets.all(0),
//               shrinkWrap: true,
//               itemCount: servicesModel.length,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         servicesModel[index].providerImage.toString(),
//                         height: 100,
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     text(servicesModel[index].providerServies,
//                             fontWeight: FontWeight.w500)
//                         .paddingLeft(spacing_twinty),
//                   ],
//                 ).paddingTop(spacing_standard_new);
//               },
//             ).paddingSymmetric(horizontal: spacing_large),
//           ),
//         ],
//       ),
//     );
//   }
// }
