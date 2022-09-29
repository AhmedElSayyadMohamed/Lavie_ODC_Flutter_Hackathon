import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/widget/create_post_widget.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_app_bar/custom_app_bar.dart';
import '../../../data_layer/bloc/profileCubit/profile_cubit.dart';

class CreatePostScreen extends StatelessWidget{
  CreatePostScreen({Key? key}) : super(key: key);
  final postFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit =ProfileCubit.get(context);

    return Scaffold(
         appBar:const CustomAppBar(
           isBackButton: true,
           title: 'Create New Post',
         ),
         body: Padding(
           padding:  EdgeInsets.symmetric(
             horizontal: MediaQuery.of(context).size.width*0.08,
             vertical:MediaQuery.of(context).size.height*0.045,
           ),
           child: SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
             child: CreatePostWidget(
               onTapOnAddPhoto: (){
                cubit.pickImage();
               }, postFormKey: postFormKey,
             ),
           ),
         ),
       );

  }
}