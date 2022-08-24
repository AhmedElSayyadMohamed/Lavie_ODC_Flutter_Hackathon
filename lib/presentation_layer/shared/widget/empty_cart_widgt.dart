import 'package:flutter/material.dart';
import '../resources/assets_manger.dart';

Widget emptyCardItem({
  required BuildContext context,
}){
  return  Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.5,
        // color: Colors.redAccent,
        child:Image.asset(AssetsManager.empty) ,
      ),
      Text("Your cart is empty",
        style: Theme.of(context).textTheme.headline6!.copyWith(
          fontSize: 24,
        ),),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text("Sorry, the keyword you entered cannot be found,"
            " please check again or search with another keyword.",
          textAlign: TextAlign.center,

          style:Theme.of(context).textTheme.bodyText2!.copyWith(
            height: 1.3,
          ),
        ),
      ),

    ],
  );
}