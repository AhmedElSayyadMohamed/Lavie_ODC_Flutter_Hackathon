import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';
import 'package:lavie/presentation_layer/shared/widget/card_item.dart';
import 'package:lavie/presentation_layer/shared/widget/empty_cart_widgt.dart';
import 'package:lavie/presentation_layer/shared/widget/listview_of_products.dart';
import 'package:lavie/presentation_layer/shared/widget/pill_card_item.dart';

import '../../../data_layer/database/local_database/database_helper.dart';
import '../../models/product_model.dart';
import '../../shared/resources/color_manager.dart';

class CardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "My Card",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: BlocConsumer<GeneralLavieCubit,GeneralLavieStates>(
        listener:(context,state){} ,
        builder: (context,state){
          var cubit =GeneralLavieCubit.get(context);
          return cubit.cardItems.isEmpty?
            emptyCardItem(context: context) :
            Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child:
                  listViewOfCards(context: context),
                ),
              ),
              pillCardItem(context: context),
            ],
          );
        },

      ),
    );
  }
}
