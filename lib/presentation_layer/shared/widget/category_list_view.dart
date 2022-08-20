import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/widget/category_item.dart';

Widget categoryListView({
    required BuildContext context,
    required VoidCallback onTap
    }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => 
        categoryItem(
          context: context,
          index: index,
          onTap: onTap,
        ),
        separatorBuilder: (context, index) => 
        const SizedBox(
          width: 10,
        ),
        itemCount: 10,
      ),
    );
  }