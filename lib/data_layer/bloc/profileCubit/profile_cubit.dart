import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/presentation_layer/models/user_model.dart';

import '../../../presentation_layer/shared/constant/constant.dart';
import '../../dio_helper/end_points.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);


  //////// variables////////
  bool toggleBetweenAllForumAndMyForum = true;

  //////////////Methods///////////////////
  void toggleBetweenAllForumAndMyForumButton({required bool isALlForum}) {
    toggleBetweenAllForumAndMyForum = isALlForum;
    emit(ChangeIsAllForumState());
  }
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    await DioHelper.getData(
      url: EndPoints.getUserData,
      token: token,
    ).then((value) {
      UserModel.data = Map<String, dynamic>.from(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print("error When getUserdata :${error.toString()}");
      emit(GetUserDataErrorState());
    });
  }


  final ImagePicker _imagePicker = ImagePicker();
  XFile? postImage;
  String? imageBase64;
  Future pickImageFromGallary() async {
    await _imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      postImage = XFile(value!.path);
      final bytes = File(postImage!.path).readAsBytesSync();
      imageBase64 = base64Encode(bytes);
      print(imageBase64);
      emit(PickImageSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(PickImageErrorState());
    });
  }


  void createNewPost({
    required String title,
    required String description,
    required imageBase64,
  }){
    emit(UploadPostLoadingState());
    DioHelper.postData(
        url: EndPoints.uploadPost,token: token, data:{
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


}



