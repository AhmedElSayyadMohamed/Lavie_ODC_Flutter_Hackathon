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
  bool isLoginSecure = true;
  bool isSignUpSecure = true;

  void toggleLoginEyesOfPassword() {
    isLoginSecure = !isLoginSecure;
    emit(LogInPasswordSecurityState());
  }

  void toggleSignUpEyesOfPassword() {
    isSignUpSecure = !isSignUpSecure;
    emit(SignUpPasswordSecurityState());
  }

  UserDataModel? userDataModel;

  void userLogin({
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

  // void signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login(permissions: (['email', 'public_profile']));
  //     final token = result.accessToken!.token;
  //     print('Facebook token userID : ${result.accessToken!.grantedPermissions}');
  //     final graphResponse = await http.get(Uri.parse( 'https://graph.facebook.com/'
  //         'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
  //
  //     final profile = jsonDecode(graphResponse.body);
  //     print("Profile is equal to $profile");
  //     try {
  //       final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
  //       final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomePage()),
  //       );
  //     }catch(e)
  //     {
  //       final snackBar = SnackBar(
  //         margin: const EdgeInsets.all(20),
  //         behavior: SnackBarBehavior.floating,
  //         content:  Text(e.toString()),
  //         backgroundColor: (Colors.redAccent),
  //         action: SnackBarAction(
  //           label: 'dismiss',
  //           onPressed: () {
  //           },
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //
  //   } catch (e) {
  //     print("error occurred");
  //     print(e.toString());
  //   }
  // }


  void userLoginWithGoogle({
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
