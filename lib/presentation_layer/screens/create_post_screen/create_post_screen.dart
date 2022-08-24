import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/widget/create_post_widget.dart';

import '../../../data_layer/bloc/profileCubit/profile_cubit.dart';

class CreatePostScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return BlocConsumer<ProfileCubit,ProfileStates>(
     listener: (context,state){},
     builder:(context,state){
       var cubit =ProfileCubit.get(context);
       return Scaffold(
         appBar: AppBar(
           leading: IconButton(
             padding: EdgeInsets.zero,
             splashRadius: 30,
             onPressed: () {
               Navigation.navigatorBack(context: context);
             },
             icon: const Icon(Icons.arrow_back_ios),
           ),
           title: Text("Create New Post",
             style: Theme.of(context).appBarTheme.titleTextStyle,
           ),
         ),
         body: Padding(
           padding:  EdgeInsets.symmetric(
             horizontal: MediaQuery.of(context).size.width*0.08,
             vertical:MediaQuery.of(context).size.height*0.045, ),
           child: SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
             child: createPostWidget(
               context: context,
               onTapOnAddPhoto: (){
                cubit.pickImageFromGallary();
               },
               onTapOnUploadPost: (){
                 cubit.createNewPost(
                     title:postTitleController.text,
                     description: postDescriptionController.text,
                   imageBase64: cubit.imageBase64,
                 );
               },
             ),
           ),
         ),
       );
     } ,

   );
  }


}