import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

var searchController =TextEditingController();
Widget searchBar({
  required BuildContext context,
  VoidCallback? onTap,
  ValueChanged<String>? onSubmitted,

}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onTap: onTap,
          onSubmitted: onSubmitted,
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(
              IconBroken.Search,
              size: 20,
              color: ColorManager.lightGrey,
            ),
          ),
        ),
      ),
    ),
  );
}
