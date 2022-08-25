
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/application_layer/routes_manager.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/presentation_layer/models/user_model.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import '../../../presentation_layer/models/my_posts_model.dart';
import '../../../presentation_layer/shared/constant/constant.dart';
import '../../dio_helper/end_points.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);


  //////// variables////////
  bool toggleBetweenAllForumAndMyForum = false;
  bool isImagePicked=false;
  bool isAddLike=false;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? postImage;
  String? imageBase64;


  //////////////Methods///////////////////
  void toggleBetweenAllForumAndMyForumButton({required bool isALlForum}) {
    toggleBetweenAllForumAndMyForum = isALlForum;
    emit(ChangeIsAllForumState());
  }
  void toggleLikeButton() {
    isAddLike=!isAddLike;

    emit(ChangeAddLikeState());
  }

  void changeState(){
    emit(ChangeState());
  }

  //get UserData
  UserModel? userModel;
  Future<void> getUserData() async {

    emit(GetUserDataLoadingState());
    await DioHelper.getData(
      url: EndPoints.getUserData,
      token: token,
    ).then((value) {
      userModel=UserModel.fromJson(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print("error When getUserdata :${error.toString()}");
      emit(GetUserDataErrorState());
    });
  }


  Future pickImage() async {

    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      postImage = XFile(value!.path);
      final bytes = File(postImage!.path).readAsBytesSync();
      imageBase64 = "data:image/png;base64,"+base64Encode(bytes);
      print(imageBase64);
      emit(PickImageSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(PickImageErrorState());
    });
  }

  Future<void> createNewPost({
    required String title,
    required String description,
    required imageBase64,
  })async{
    print("token $token");
    emit(UploadPostLoadingState());
    DioHelper.postData(
        url: EndPoints.uploadPost,token: "Bearer $token", data:{
      "title": title,
      "description": description,
      "imageBase64": imageBase64,
    }).then((value) {
      print(value);
      emit(UploadPostSuccessState());
    }).catchError((error){
      print("error when Upload post :${error.toString()}");
      emit(UploadPostErrorState());
    });
  }

  Future<void> editUserData({
    required String firstName,
    required String lastName,
    // required String email,
    // required String address,
  }) async {
    emit(EditUserDataLoadingState());
    await DioHelper.patchData(
      url: EndPoints.updateUserData,
      data: {
        "firstName": "firstName",
        "lastName": lastName,
        // "email": email,
        // "address": "tempor elit sed"
      },
    ).then((value) {
      emit(EditUserDataSuccessState());
    }).catchError((error) {
      print("error When editUserdata :${error.toString()}");
      emit(EditUserDataErrorState());
    });
  }

  MyPostsModel? myPostsModel;
  void getMyPosts(){
     emit(GetMyPostLoadingState());

    DioHelper.getData(url:EndPoints.getMyForums,token: token).then((value){
      myPostsModel = MyPostsModel.fromJson(value.data);
      emit(GetMyPostSuccessState());
    }).catchError((error){
      print("error when get MyPosts :${error.toString()}");
      emit(GetMyPostErrorState());
    });
  }


  Future addLike({
        required String postId,
        String? userId,
      }) async {

    emit(AddLikeLoadingState());

    print(token);
    return await DioHelper.postData(
        url: "${EndPoints.likePost+postId}/like",
        token:token,
      ).then((value) {

        getMyPosts();
      emit(AddLikeSuccessState());
    }).catchError((error) {
      print("error when add like :${error.toString()}");
      emit(AddLikeErrorState());
    });
  }
  //logOut
  void logOut({
  required BuildContext context,
}){

    CachHelper.removeData(key: "token").then((value) {
      token ="";
      GeneralLavieCubit.get(context).currentBottomNavIndex = 2;
      GeneralLavieCubit.get(context).filterProductByCategory(0);
      Navigation.navigateAndFinish(
        context: context,
        navigatorTo:Routes.authenticationRoute,
      );
    }).catchError((error){
      print("error When logOut :${error.toString()}");
    });
  }




}



