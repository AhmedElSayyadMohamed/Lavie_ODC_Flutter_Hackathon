import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/widget/blog_details_item.dart';
import '../../shared/resources/color_manager.dart';

class BlogDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: blogDetailsBlogItem(
            context: context,
            imageURL: "assets/images/tree2.png",
            title: "title",
            description: "leaf, in botany, any usually flattened green outgrowth from the stem of  "
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of  "
                "leaf, in botany, any usually flattened green outgrowth from the stem of  "
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of  "
                "leaf, in botany, any usually flattened green outgrowth from the stem of  "
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of"
                "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
        ),
      ),
    );
  }
}
