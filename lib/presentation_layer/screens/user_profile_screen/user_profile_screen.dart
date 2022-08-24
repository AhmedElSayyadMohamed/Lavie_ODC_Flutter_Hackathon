import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/constant/constant.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/profile_card_point_and_update_user_data.dart';
import '../../../application_layer/routes_manager.dart';
import '../../../data_layer/bloc/profileCubit/profile_cubit.dart';
import '../../../data_layer/bloc/profileCubit/profile_states.dart';
import '../../models/user_model.dart';
import '../../shared/component/default_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(

      listener: (context,state){},
      builder: (context,state){
        var cubit =ProfileCubit.get(context);
        return  Scaffold(
          backgroundColor:ColorManager.black ,
          body: SafeArea(
            child: state is GetUserDataLoadingState?
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.37,
                      child:CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:UserModel.getImageUrl(),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        errorWidget: (context, url, error) =>const Icon(Icons.error),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: ColorManager.black.withOpacity(0.9),
                      height: MediaQuery.of(context).size.height * 0.37,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:UserModel.getImageUrl(),
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                              ),
                              errorWidget: (context, url, error) =>const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(UserModel.getName(),style:Theme.of(context).textTheme.headline2!.copyWith(
                            color: ColorManager.white,
                          ) ,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {  },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ColorManager.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              CachHelper.removeData(key: "token").then((value) {
                                token ="";
                                GeneralLavieCubit.get(context).currentBottomNavIndex = 2;

                                Navigation.navigateAndFinish(
                                  context: context,
                                  navigatorTo:Routes.authenticationRoute,
                                );
                              }).catchError((error){
                                print("error When logOut :${error.toString()}");
                              });
                            },
                            icon: const Icon(
                             Icons.logout_outlined,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color:Theme.of(context).backgroundColor,
                      borderRadius:const BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10,end: 10,top: 10),
                      child: SingleChildScrollView(
                        physics:const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileCardItem(
                              context: context,
                              editLogo: AssetsManager.pointLogo,
                              label:"You have  ${UserModel.getUserPoints()} points",
                              labelStyle: Theme.of(context).textTheme.headline1,
                              backgroundColor:ColorManager.whiteCyan,
                              borderColor:ColorManager.whiteCyan,
                              borderRadius: 10,
                              isButton: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultButton(
                              height: 50,
                              onTap:(){
                                Navigation.navigatorTo(context: context, navigatorTo:Routes.discussionForums);
                              },
                              label: "Forums",
                              labelStyle:Theme.of(context).textTheme.caption ,
                              borderColor: Theme.of(context).primaryColor,
                              buttonColor:ColorManager.white ,
                              borderRadius: 10,
                            ),
                            const  SizedBox(
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
                                profileCardItem(
                                  context: context,
                                  editLogo: AssetsManager.editLogo,
                                  label:"Change Name",
                                  labelStyle: Theme.of(context).textTheme.headline1,
                                  backgroundColor: ColorManager.white,
                                  borderColor:ColorManager.black,
                                  borderRadius: 10,
                                  isButton: true,
                                  onTap: (){},
                                ),
                                const SizedBox(
                                  height:20,
                                ),

                                profileCardItem(
                                  context: context,
                                  editLogo: AssetsManager.editLogo,
                                  label:"Change Email",
                                  labelStyle: Theme.of(context).textTheme.headline1,
                                  backgroundColor: ColorManager.white,
                                  borderColor:ColorManager.black,
                                  borderRadius: 10,
                                  isButton: true,
                                  onTap: (){


                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





