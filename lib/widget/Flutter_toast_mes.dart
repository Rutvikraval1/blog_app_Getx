


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Flutter_toast_mes {
  void Error_Message(String Message,{bool error_code=false }) {
    Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: error_code?Colors.red:Colors.green,
        textColor: Colors.white,
        webBgColor: "#505050",
        webPosition: "center",
        webShowClose: false,
        fontSize: 16.0);
  }
}