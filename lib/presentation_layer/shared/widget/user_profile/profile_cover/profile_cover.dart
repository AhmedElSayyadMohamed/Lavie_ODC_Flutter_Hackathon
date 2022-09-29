
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import '../../../../../data_layer/bloc/profileCubit/profile_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../custom_circle_progress_indicator/circle_progress_indicator.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileStates>(
      builder: (context,state){
        var cubit =ProfileCubit.get(context);
        return  SizedBox(
          height: MediaQuery.of(context).size.height*0.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:cubit.userModel!.data!.imageUrl.toString(),
                placeholder: (context, url) => const CustomCircleProgressIndicator(),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
              ),
              Container(
                width: double.infinity,
                color: ColorManager.black.withOpacity(0.9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:cubit.userModel!.data!.imageUrl.toString(),
                        placeholder: (context, url) => const CustomCircleProgressIndicator(),
                        errorWidget: (context, url, error) =>const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(cubit.userModel!.data!.firstName.toString()+
                        cubit.userModel!.data!.lastName.toString(),
                      style:Theme.of(context).textTheme.headline2!.copyWith(
                        color: ColorManager.white,
                      ) ,),
                  ],
                ),
              ),
              Positioned(
                top: 40.h,
                right: 10.w,
                child: IconButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    cubit.logOut(context: context);
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
