import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { success, error, warning }

class Alarm {
  static Future<bool?> flutterToast({
    required String massage,
    required ToastState toastState,
  }) {
    return Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: toastColor(toastState),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Color toastColor(ToastState state) {
    Color color;

    switch (state) {
      case ToastState.success:
        color = Colors.green;
        break;
      case ToastState.error:
        color = Colors.redAccent;
        break;
      case ToastState.warning:
        color = Colors.amber;
        break;
    }

    return color;
  }
}
