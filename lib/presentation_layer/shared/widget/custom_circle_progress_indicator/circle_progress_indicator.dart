import 'package:flutter/material.dart';

class CustomCircleProgressIndicator extends StatelessWidget{
  const CustomCircleProgressIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Center(
     child: CircularProgressIndicator(
       color: Theme.of(context).primaryColor,
       strokeWidth: 3,
     ),
   );
  }
}