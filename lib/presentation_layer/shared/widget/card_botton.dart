import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

class CustomCardButton extends StatelessWidget{

  final void Function()? onTap;
  const CustomCardButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 55.h,
          width: 65.w,
          child: Icon(
            IconBroken.Buy,
            size: 25,
            color: ColorManager.lightWhite,
          ),
        ),
      ),
    );
  }
}
