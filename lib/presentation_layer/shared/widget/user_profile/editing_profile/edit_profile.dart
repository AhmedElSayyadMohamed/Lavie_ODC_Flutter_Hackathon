import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';
import 'package:lavie/presentation_layer/shared/widget/user_profile/editing_profile/edit_model_sheet.dart';
import '../../../../../application_layer/routes_manager.dart';
import '../../../../../data_layer/bloc/profileCubit/profile_cubit.dart';
import '../../../../../data_layer/bloc/profileCubit/profile_states.dart';
import '../../../component/default_button.dart';
import '../../../component/default_navigation.dart';
import '../../../resources/assets_manger.dart';
import '../../../resources/color_manager.dart';
import '../../profile_card_point_and_update_user_data.dart';

class ProfileEdit extends StatelessWidget {

   final  editUserFirstNameController =TextEditingController();
   final  editUserLastNameController =TextEditingController();
   final  editUserEmailController =TextEditingController();

   ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileStates>(
      builder: (context,state){
        var cubit =ProfileCubit.get(context);
        editUserFirstNameController.text = cubit.userModel!.data!.firstName.toString();
        editUserLastNameController.text  = cubit.userModel!.data!.lastName.toString();
        editUserEmailController.text  = cubit.userModel!.data!.email.toString();
        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.48,
            decoration:  BoxDecoration(
              color:Theme.of(context).backgroundColor,
              borderRadius:const BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                topEnd: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10,
                end: 10,
                top: 10,
              ),
              child: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileCardItem(
                      editLogo: AssetsManager.pointLogo,
                      label:"You have  ${cubit.userModel!.data!.userPoints} points",
                      labelStyle: Theme.of(context).textTheme.headline1,
                      backgroundColor:ColorManager.whiteCyan,
                      borderColor:ColorManager.whiteCyan,
                      borderRadius: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      height: 50,
                      onTap:(){
                        cubit.getMyPosts();
                        Navigation.navigatorTo(context: context, navigatorTo:Routes.discussionForums);
                      },
                      label: "Forums",
                      labelStyle:Theme.of(context).textTheme.caption ,
                      borderColor: Theme.of(context).primaryColor,
                      buttonColor:ColorManager.white ,
                      borderRadius: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edit Profile",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const  SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            showBottomSheet(
                                context: context,
                                backgroundColor:Colors.black87.withOpacity(0.1),
                                builder:(context)=>EditModelSheet(
                                  controller: editUserFirstNameController,
                                  lastNameController: editUserLastNameController,
                                  textFormLabel: 'firstName',
                                  lastName: 'lastName',
                                  isEditUserName: true,
                                  editOnTap: () {
                                    cubit.editUserData(
                                      firstName: editUserFirstNameController.text,
                                      lastName: editUserLastNameController.text,
                                      email: editUserEmailController.text
                                    ).then((value) {
                                      Alarm.flutterToast(massage:'data updated successfully', toastState: ToastState.success);
                                      Navigator.pop(context);

                                    });
                                  },
                                ),
                            );
                          },
                          child: ProfileCardItem(
                            editLogo: AssetsManager.editLogo,
                            label:"Change Name",
                            labelStyle: Theme.of(context).textTheme.headline1,
                            backgroundColor: ColorManager.white,
                            borderColor:ColorManager.black,
                            borderRadius: 10,
                            isButton: true,
                          ),
                        ),
                        const SizedBox(
                          height:20,
                        ),
                        InkWell(
                          onTap: (){
                            showBottomSheet(
                                context: context,
                                backgroundColor:Colors.black87.withOpacity(0.1),
                                builder:(context)=>EditModelSheet(
                                  controller: editUserEmailController,
                                  textFormLabel: 'userEmail',
                                  editOnTap: () {
                                    cubit.editUserData(
                                        firstName: editUserFirstNameController.text,
                                        lastName: editUserLastNameController.text,
                                        email: editUserEmailController.text
                                    ).then((value) {
                                      Alarm.flutterToast(massage:'data updated successfully', toastState: ToastState.success);
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                            );
                          },
                          child: ProfileCardItem(
                            editLogo: AssetsManager.editLogo,
                            label:"Change Email",
                            labelStyle: Theme.of(context).textTheme.headline1,
                            backgroundColor: ColorManager.white,
                            borderColor:ColorManager.black,
                            borderRadius: 10,
                            isButton: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
