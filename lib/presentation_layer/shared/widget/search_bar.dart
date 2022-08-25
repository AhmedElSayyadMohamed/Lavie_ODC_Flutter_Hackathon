import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/app_items_color.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

Widget searchBar({
   required BuildContext context,
   VoidCallback? onTap,
   ValueChanged<String>? onSubmitted,
   ValueChanged<String>? onChanged,
   var searchController ,
   required bool enabled,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:AppColor.backgroundSearchBar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(

          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: AppColor.labelSearchBar,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            border: InputBorder.none,
            enabled:enabled ,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(
              IconBroken.Search,
              size: 20,
              color:AppColor.searchIconSearchBar,
            ),
          ),
          onSubmitted: onSubmitted,
          onChanged: onChanged ,
        ),
      ),
    ),
  );
}
