import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/screens/blogs_Screen/blogs_screen.dart';
import 'package:lavie/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:lavie/presentation_layer/screens/notification_screen/notification_screen.dart';
import 'package:lavie/presentation_layer/screens/scan_screen/scan_screen.dart';
import 'package:lavie/presentation_layer/screens/user_profile_screen/user_profile_screen.dart';
import 'package:lavie/presentation_layer/shared/constant/constant.dart';

import '../../../presentation_layer/models/user_model.dart';

class GeneralLavieCubit extends Cubit<GeneralLavieStates> {
  GeneralLavieCubit() : super(InitialState());
  static GeneralLavieCubit get(BuildContext context) => BlocProvider.of(context);



  // variables
  int currentBottomNavIndex = 2;
  int filterCategoryButtonIndex = 0;
  bool toggleBetweenAllForumAndMyForum=true;

  List<Widget> screen = [
    BlogsScreen(),
    ScanScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeBottomNavBarIndex(index) {
    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndexState());
  }
  void changeCategoryIndex(index) {
    filterCategoryButtonIndex = index;
    emit(ChangeCategoryIndexState());
  }

  void changeIsAllForum({
  required bool isALlForum
  }) {
    toggleBetweenAllForumAndMyForum = isALlForum;
    emit(ChangeIsAllForumState());
  }

  Future<void> getUserData()async {
    print("token:$token");
    emit(GetUserDataLoadingState());
   await DioHelper.getData(
      url:EndPoints.getUserData,
      token:token,
   ).then((value){
    print(value.data);
    UserModel.data =Map<String,dynamic>.from(value.data);
    emit(GetUserDataSuccessState());
  }).catchError((error){
     print("error When getUserdata :${error.toString()}");
    emit(GetUserDataErrorState());
    });

  }

}
