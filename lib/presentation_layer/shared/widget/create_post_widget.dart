import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/default_text_form_field.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_circle_progress_indicator/circle_progress_indicator.dart';
import '../../../data_layer/bloc/profileCubit/profile_cubit.dart';

class CreatePostWidget extends StatelessWidget {
  final postFormKey ;
  final VoidCallback onTapOnAddPhoto;
  CreatePostWidget({Key? key, required this.onTapOnAddPhoto, required this.postFormKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (BuildContext context, state) {
        var cubit = ProfileCubit.get(context);

        return Form(
          key: postFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:cubit.isImagePicked
                      ? Border.all(color: Colors.red)
                      : Border.all(color: Theme.of(context).primaryColor),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  radius: 20,
                  onTap: onTapOnAddPhoto,
                  child: cubit.postImage != null
                      ? Image(
                          fit: BoxFit.cover,
                          image: FileImage(File(cubit.postImage!.path)),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: cubit.isImagePicked
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add photo",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: cubit.isImagePicked
                                    ? Colors.red
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              CustomTextFormField(
                controller: AppControllers.createPostTitleController,
                keyboardType: TextInputType.text,
                istextUpTextField: true,
                textUpTextField: "Title",
                formBorderRadius: 7,
                validate: (value) {
                  if (value == "") {
                    return "you must type a title";
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              CustomTextFormField(
                controller: AppControllers.createPostDescriptionController,
                keyboardType: TextInputType.text,
                istextUpTextField: true,
                textUpTextField: "Description",
                expand: true,
                maxline: 5,
                formBorderRadius: 5,
                validate: (value) {
                  if (value == "") {
                    return "you must type a description";
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              cubit.state is UploadPostLoadingState
                  ? const CustomCircleProgressIndicator()
                  : DefaultButton(
                      onTap: () {
                        if(cubit.isImagePicked==null){
                          cubit.isImagePicked =true;
                          cubit.changeState();
                        }
                        if (postFormKey.currentState!.validate()) {
                          uploadAPost(context);
                        }
                      },
                      label: "Post",
                      labelStyle: Theme.of(context).textTheme.button,
                      buttonColor: Theme.of(context).primaryColor,
                      borderRadius: 10,
                    ),
            ],
          ),
        );
      },
    );
  }

  void uploadAPost(BuildContext context){
    var cubit = ProfileCubit.get(context);
    cubit.createNewPost(
      title: AppControllers.createPostTitleController.text,
      description: AppControllers.createPostDescriptionController.text,
      imageBase64: cubit.imageBase64,
    ).then((value) {clearControllersAfterUploadPost(context);}).catchError((error){
      debugPrint("error when upload a post :${error.toString()}");
    });
  }
  void clearControllersAfterUploadPost(BuildContext context){
    var cubit = ProfileCubit.get(context);

      cubit.getMyPosts();
      cubit.isImagePicked = false;
      AppControllers.createPostTitleController.clear();
      AppControllers.createPostDescriptionController.clear();
      cubit.postImage = null;
      Navigator.pop(context);
      Alarm.flutterToast(
          massage: "Post upLoaded Successfully",
          toastState: ToastState.success);
      cubit.changeState();
  }
}
