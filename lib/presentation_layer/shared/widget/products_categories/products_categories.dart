import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/presentation_layer/shared/widget/products_categories/category_button.dart';
import '../../constant/category_list.dart';

class ProductHomeCategories extends StatelessWidget{

  const ProductHomeCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit =GeneralLavieCubit.get(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.06,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String categoryName = categoryList[index];
          return CategoryButton(
            index: index,
            categoryName:categoryName ,
            onTap: (){
              cubit.filterProductsByCategory(index);
            },
          );
        },

        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: categoryList.length,
      ),
    );
  }

}

