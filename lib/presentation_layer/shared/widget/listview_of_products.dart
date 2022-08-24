import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/presentation_layer/shared/widget/card_item.dart';

import '../../../data_layer/database/local_database/database_helper.dart';
import '../component/flutter_toast.dart';

Widget listViewOfCards({
  required BuildContext context,
}){

  var cubit= GeneralLavieCubit.get(context);
  return  ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context,index)=>cardItem(
      context: context,
      productURL:cubit.cardItems[index]["image"],
      productName:cubit.cardItems[index]["title"],
      productPrice:cubit.cardItems[index]["price"],
      quantity: cubit.cardItems[index]["quantity"],
      onTapAddProduct: (){
        cubit.incrementQuantityOfProductInCard(quantity:cubit.cardItems[index]["quantity"]);
        DatabaseHelper.updateRecordInDatabase(
          quantity:cubit.increaseProductInCard,
          id: cubit.cardItems[index]["id"],
          context: context,
        );
      },
      onTapMinusProduct: (){
        cubit.decrementQuantityOfProductInCard(quantity:cubit.cardItems[index]["quantity"]);
        DatabaseHelper.updateRecordInDatabase(
          quantity:cubit.decreaseProductInCard,
          id: cubit.cardItems[index]["id"],
          context: context,
        );
      },
      onTapRemoveProductFromMyCard: (){
        cubit.changProductWhichGoToCardIndex(index);

        DatabaseHelper.deleteRecordFromDatabase(
          context:context,
          id: cubit.cardItems[index]["id"],
        ).then((value) {
          Alarm.flutterToast(
            massage:"${cubit.cardItems[index]["title"]} deleted From Database Successfully",
            toastState: ToastState.success,
          );
        }).catchError((error){
          print("error when delete ${cubit.cardItems[index]["title"]} from database:${error.toString()}");
        });
      },
    ),
    itemCount: cubit.cardItems.length,
  );
}