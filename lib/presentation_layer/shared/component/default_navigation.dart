import 'package:flutter/cupertino.dart';

class Navigation {
  static void navigatorTo({
    required BuildContext context,
    required String navigatorTo,
  }) {
    Navigator.pushNamed(context, navigatorTo);
  }


  static void navigateAndFinish({
    required BuildContext context,
    required String navigatorTo,
  }) {
    Navigator.pushReplacementNamed(context, navigatorTo);
  }
}
