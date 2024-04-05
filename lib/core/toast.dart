import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskmanagerapp/core/theme.dart';


void showToastFlutter(
  msg, {
  ToastGravity gravity = ToastGravity.TOP,
  Color color = kcGreen,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    backgroundColor: color,
    textColor: kcWhite,
    fontSize: 16.0,
  );
}
