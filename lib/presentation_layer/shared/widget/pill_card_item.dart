import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';

import '../component/default_button.dart';
import '../resources/color_manager.dart';

Widget pillCardItem({
  required BuildContext context,
}){
  var cubit =GeneralLavieCubit.get(context);
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height*0.18,
    decoration: BoxDecoration(
      color: ColorManager.lightWhite,
      borderRadius:const BorderRadiusDirectional.only(
        topStart: Radius.circular(20),
        topEnd: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text("Total",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 20,
                ),),
              const Spacer(),
              Text("${cubit.calculateTotalOfPill().toString()} EGP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColor,
                ),)

            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          DefaultButton(
            onTap:(){},
            label: "CheckOut",
            labelStyle: Theme.of(context).textTheme.button,
            buttonColor: Theme.of(context).primaryColor,
            height: 45,
            borderRadius: 10,
          ),
        ],
      ),
    ),
  );
}