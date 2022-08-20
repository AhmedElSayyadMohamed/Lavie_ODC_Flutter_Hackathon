import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

Widget cardBotton({
  required BuildContext context,
  required GestureTapCallback? onTap,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      onTap: onTap,
      child: Ink(
        height: 55,
        width: 65,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            IconBroken.Buy,
            size: 25,
            color: ColorManager.lightWhite,
          ),
        ),
      ),
    ),
  );
}
