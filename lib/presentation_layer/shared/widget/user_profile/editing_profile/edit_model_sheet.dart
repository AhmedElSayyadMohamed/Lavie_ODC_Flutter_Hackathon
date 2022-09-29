
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_cubit.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_circle_progress_indicator/circle_progress_indicator.dart';
import '../../../../../data_layer/bloc/profileCubit/profile_states.dart';
import '../../../component/default_text_form_field.dart';

class EditModelSheet extends StatelessWidget{
  final VoidCallback editOnTap;
  final String textFormLabel;
  final bool isEditUserName ;
  final String lastName;
  final TextEditingController controller;
  final TextEditingController? lastNameController;
  const EditModelSheet({Key? key,
    required this.editOnTap,
    required this.textFormLabel,
    required this.controller,
    this.isEditUserName =false,
    this.lastName = '',
    this.lastNameController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileStates>(
      builder: (context,state){
        var cubit =ProfileCubit.get(context);
        return  Container(
          height: MediaQuery.of(context).size.height*0.48,
          decoration:  BoxDecoration(
            color:Theme.of(context).backgroundColor,
            borderRadius:const BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  children:[
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Icon(Icons.arrow_drop_down,color: Colors.white70,)
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.06,
                    ),
                    CustomTextFormField(
                      controller:controller,
                      istextUpTextField: true,
                      textUpTextField: textFormLabel,
                      keyboardType: TextInputType.text,
                    ),
                    Visibility(
                        visible: isEditUserName,
                        child:Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller:lastNameController,
                              istextUpTextField: true,
                              textUpTextField: lastName,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.07,
                    ),
                   state is EditUserDataLoadingState?
                    const  CustomCircleProgressIndicator()
                    :DefaultButton(
                      width: MediaQuery.of(context).size.width*0.45,
                      height:  MediaQuery.of(context).size.width*0.13,
                      onTap: editOnTap,
                      label: 'Edit',
                      labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor,),
                      buttonColor: ColorManager.white,
                      borderColor: Theme.of(context).primaryColor ,
                      borderRadius: 10,
                    )
                  ]
              ),
            ),
          ),
        );
      },
    );
  }
}