import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/widget/blog_item.dart';

import '../../../application_layer/routes_manager.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blogs",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
           blogItem(
               context: context,
               imageURL: "assets/images/tree2.png",
               name: "5 Tips to treat plants",
               description: "leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually ",
               date: "2 Day ago",
             onTap: () {
                 Navigation.navigatorTo(context: context, navigatorTo: Routes.blogDetailsScreen);
             },
           ),
          ],
        ),
      ),
    );
  }
}
