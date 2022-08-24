import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/presentation_layer/shared/widget/filter_category_button_item.dart';

import '../constant/category_list.dart';
Widget categoryListView({
    required BuildContext context,
    }) {
  var cubit =GeneralLavieCubit.get(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => 
        filterCategoryButtonItem(
          context: context,
          index: index,
          categoryName:categoryList[index] ,
          onTap: (){
            cubit.changeCategoryIndex(index);
          },
        ),
        separatorBuilder: (context, index) => 
        const SizedBox(
          width: 10,
        ),
        itemCount: categoryList.length,
      ),
    );
  }