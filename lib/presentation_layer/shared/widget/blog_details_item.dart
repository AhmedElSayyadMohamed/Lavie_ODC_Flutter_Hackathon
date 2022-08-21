import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

import '../component/default_navigation.dart';

Widget blogDetailsBlogItem({
  required BuildContext context,
  required String imageURL,
  required String title,
  required String description,
}){

  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
          children:[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.4,
              color: ColorManager.whiteAccent,
              child: Image.asset(imageURL),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                onPressed: (){
                  Navigation.navigatorBack(context: context);
                },
                icon:const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ]

      ),
      SizedBox(
        height: 20.h,
      ),
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.all(24.w),
            child: Center(
              child: Text(
                description,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color:ColorManager.greyAccent
                ),
              ),
            ),
          ),
        ),
      )
    ],
  );
}