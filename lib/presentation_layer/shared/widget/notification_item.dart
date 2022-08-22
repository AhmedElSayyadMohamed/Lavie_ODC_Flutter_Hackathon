import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

Widget notificationItem({
  required BuildContext context,
  required String imageURL,
  required String notificationMassege,
  required String notificationDate,

}) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal:16.w),
    child: ListTile(
      leading:  CircleAvatar(
        backgroundImage: AssetImage(imageURL),
      ),
      title: Text(
        notificationMassege,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: ColorManager.black,
            ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          notificationDate,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 14,
                color: ColorManager.greyAccent,
              ),
        ),
      ),
    ),
  );
}
