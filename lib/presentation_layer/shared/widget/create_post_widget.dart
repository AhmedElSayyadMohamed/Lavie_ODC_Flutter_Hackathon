import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/default_text_form_field.dart';

var postTitleController =TextEditingController();
var postDescriptionController =TextEditingController();

Widget createPostWidget({
  required BuildContext context,
  required VoidCallback onTapOnAddPhoto,
  required VoidCallback onTapOnUploadPost,
}){

var cubit =GeneralLavieCubit.get(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          radius:20,
          onTap:onTapOnAddPhoto,
          child:cubit.postImage!=null?
          Image(
         fit: BoxFit.cover,
         image:FileImage(

      File(cubit.postImage!.path)),
         ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,),
              const SizedBox(
                height: 10,
              ),
              Text("Add photo",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),),
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height*0.04,
      ),
      CustomTextFormField(
        controller: postTitleController,
        keyboardType: TextInputType.text,
        istextUpTextField:true,
        textUpTextField: "Title",

        formBorderRadius:7 ,
      ) ,
      SizedBox(
        height: MediaQuery.of(context).size.height*0.04,
      ),
      CustomTextFormField(
        controller: postDescriptionController,
        keyboardType: TextInputType.text,
        istextUpTextField:true,
        textUpTextField: "Description",
        expand: true,
        maxline: 5,
        formBorderRadius:5 ,
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height*0.05,
      ),
      cubit.state is UploadPostLoadingState?
      Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      )):
      DefaultButton(
        onTap: onTapOnUploadPost,
        label:"Post",
        labelStyle: Theme.of(context).textTheme.button,
        buttonColor: Theme.of(context).primaryColor,
        borderRadius: 10,
      ),
    ],
  );
}