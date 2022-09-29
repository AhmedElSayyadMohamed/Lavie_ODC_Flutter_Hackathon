import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/app_items_color.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

class CustomSearchBar extends StatelessWidget{

  final bool enabled;
  final TextEditingController searchController ;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

   const CustomSearchBar({Key? key,
    required this.enabled,
    required this.searchController,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            cursorColor:Theme.of(context).primaryColor,
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

}
