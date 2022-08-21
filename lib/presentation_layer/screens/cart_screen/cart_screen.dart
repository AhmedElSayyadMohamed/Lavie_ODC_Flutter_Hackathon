import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/card_item.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Card",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
           cardItem(
               context: context,
               productURL: "assets/images/tree2.png",
               productName: "productName",
               productPrice: "productPrice",
               quantity: 5,
               onTapAddProduct: (){},
               onTapMinusProduct: (){},
               onTapRemoveProductFromMyCard: (){},
           )
          ],
        ),
      ),
    );
  }
}
