import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';

import '../resources/app_items_color.dart';

Widget filterCategoryButtonItem({
  required BuildContext context,
  required int index,
  required GestureTapCallback? onTap,
  required String categoryName,
}) {
  var cubit =GeneralLavieCubit.get(context);
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding:const EdgeInsets.symmetric(horizontal: 25),
          height: 15,
          decoration: BoxDecoration(
            color: index == cubit.filterCategoryButtonIndex?
            AppColor.backgroundActiveFilterCategoryButtons:
            AppColor.backgroundFilterCategoryButtons,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: index == cubit.filterCategoryButtonIndex
                  ? AppColor.activeBorderFilterCategoryButtons
                  : AppColor.backgroundFilterCategoryButtons,
            ),
          ),
          child: Center(
            child: Text(
             categoryName,
              style: index == cubit.filterCategoryButtonIndex
                  ? Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColor.activeLabelFilterCategoryButtons,
                      )
                  : Theme.of(context).textTheme.bodyText2!.copyWith(
                color:AppColor.notActiveLabelFilterCategoryButtons,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
