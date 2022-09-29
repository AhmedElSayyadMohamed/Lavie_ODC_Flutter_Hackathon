import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_circle_progress_indicator/circle_progress_indicator.dart';
import '../../../data_layer/bloc/profileCubit/profile_cubit.dart';
import '../../../data_layer/bloc/profileCubit/profile_states.dart';
import '../../shared/widget/user_profile/editing_profile/edit_profile.dart';
import '../../shared/widget/user_profile/profile_cover/profile_cover.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileStates>(
        builder: (context,state){
        return  Scaffold(
          body:state is GetUserDataLoadingState?
          const CustomCircleProgressIndicator()
              : Stack(
                children:[
                   const ProfileCover(),
                   ProfileEdit(),
                ],
              ),
        );
      },
    );
  }
}