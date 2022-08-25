import 'package:flutter/material.dart';
import '../resources/assets_manger.dart';

Widget emptyCardItem({
  required BuildContext context,
  required String title,
  required String description,
}){
  return  Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.5,
        child:Image.asset(AssetsManager.empty) ,
      ),
      Text(title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 24,
        ),),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(description,
          textAlign: TextAlign.center,

          style:Theme.of(context).textTheme.bodyText2!.copyWith(
            height: 1.3,
          ),
        ),
      ),
    ],
  );
}