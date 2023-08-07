import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class utils {
  void toastMethod(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
