import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:household/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/Constant.dart';
import '../utils/Widget.dart';

class QuestionAnswar extends StatefulWidget {
  const QuestionAnswar({Key? key}) : super(key: key);

  @override
  State<QuestionAnswar> createState() => _QuestionAnswarState();
}

class _QuestionAnswarState extends State<QuestionAnswar> {
  var isLooding = false;
  CollectionReference help = FirebaseFirestore.instance.collection("Help");
  final questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: textformfield(
                maxLine: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fill the field ';
                  }
                  return null;
                },
                controller: questionController,
                obscureText: false,
                hinttext: 'Ask Question',
                prefixIcons: Icon(Icons.person_outline),
              )
                  .paddingTop(spacing_standard_new)
                  .paddingSymmetric(horizontal: spacing_standard_new),
            ),
          ],
        ),
        elevatedButton(
          context,
          height: 56.0,
          width: 270.0,
          onPress: () {
            help.doc().set({
              'Help': questionController.text.toString(),
            }).then((value) {
              setState(() {
                isLooding = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: text("Your review help Sucessful Submiited",
                        textColor: white)));
              });
            });
          },
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text("Submit Review",
                  fontWeight: FontWeight.w500, textColor: whiteColor),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xffB34167), shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_forward,
                  color: whiteColor,
                  size: 20,
                ),
              )
            ],
          ),
        ).paddingBottom(spacing_thirty)
      ],
    );
  }
}

// ignore: must_be_immutable
class reviewTextFeild extends StatelessWidget {
  Color? textcolor;
  String? hintText;
  bool? prefixIcon = true;
  reviewTextFeild({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.textcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          maxLines: 8,
          decoration: InputDecoration(
            prefix: prefixIcon == true
                ? Column(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: filedColor,
                      ),
                    ],
                  )
                : null,
            filled: true,
            fillColor: whiteColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintStyle: TextStyle(fontSize: textSizeSmall, color: grey),
            hintText: hintText,
          ),
        ),
        text("200 Charactors", fontSize: textSizeSmall, textColor: textcolor)
            .paddingRight(spacing_standard_new),
      ],
    );
  }
}
