import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class ScanDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () {
                _showButtonPressDialog(context, 'FacebookNew');
              },
            ),
          ],
        ),
      ),
    );
  }
}
void _showButtonPressDialog(BuildContext context, String provider) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('$provider Button Pressed!'),
    backgroundColor: Colors.black26,
    duration: Duration(milliseconds: 400),
  ));
}