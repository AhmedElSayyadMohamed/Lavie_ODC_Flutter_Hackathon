import 'package:flutter/material.dart';

Widget profileCardItem({
  required BuildContext context,
  required String editLogo,
  required String label,
  required  labelStyle,
  required Color backgroundColor,
  required Color borderColor,
  required double borderRadius ,
  VoidCallback? onTap ,
  bool isButton = false,
}){

  return Container(
    padding:const EdgeInsetsDirectional.all(15),
    width: double.infinity,
    height:MediaQuery.of(context).size.height*0.1,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border:Border.all(
        color: borderColor,
      ),
    ),
    child: Row(
      children: [
        Image.asset(editLogo),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: labelStyle,
        ),
        const Spacer(),
        isButton?IconButton(
          onPressed:onTap,
          icon:const Icon(Icons.arrow_forward),
        ):const SizedBox(),
      ],
    ),
  );
}