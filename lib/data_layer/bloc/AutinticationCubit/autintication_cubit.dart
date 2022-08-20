import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/models/user_model.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';
import 'autintication_states.dart';

class AuthonticationCubit extends Cubit<AuthonticationStates> {
  AuthonticationCubit() : super(AuthonticationInitialState());
  static AuthonticationCubit get(context) => BlocProvider.of(context);
  bool isloginSecure = true;
  bool isSignUpSecure = true;

  void toggelLoginEyesOfPassword() {
    isloginSecure = !isloginSecure;
    emit(LogInPasswordSecurityState());
  }

  void toggelSignUpEyesOfPassword() {
    isSignUpSecure = !isSignUpSecure;
    emit(SignUpPasswordSecurityState());
  }

  UserDataModel? userDataModel;

  void userSignIn({
    required email,
    required password,
    required BuildContext context,
  }) {
    emit(AuthonticationLoadingState());
    DioHelper.postData(url: EndPoints.signIn, data: {
      "password": password,
      "email": email,
    }).then((value) {
      userDataModel = UserDataModel.formJson(value.data);
      emit(AuthonticationSuccessState(userDataModel));
    }).onError((DioError error, stackTrace) {
        debugPrint(
            "Error When user SignUp :${error.response!.data["message"][0]}");
        emit(AuthonticationErrorState(error.response!.data["message"].toString()));
      });
  }

  void userSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) {
    emit(AuthonticationLoadingState());
    if (password == confirmPassword) {
      DioHelper.postData(url: EndPoints.signUp, data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      }).then((value) {
        debugPrint(value.data);
        userDataModel = UserDataModel.formJson(value.data);
        emit(AuthonticationSuccessState(userDataModel));
      }).onError((DioError error, stackTrace) {
        debugPrint(
            "Error When user SignUp :${error.response!.data["message"][0]}");
        emit(AuthonticationErrorState(error.response!.data["message"].toString()));
      });
    } else {
      Alarm.flutterToast(
        massage: "passwords not the same",
        toastState: ToastState.warning,
      );
      emit(AuthonticationErrorState("passwords not the same"));
    }
  }
}
