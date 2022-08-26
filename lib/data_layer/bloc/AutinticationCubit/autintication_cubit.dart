import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_cubit.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/models/register_user_model.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import '../../../presentation_layer/shared/constant/constant.dart';
import '../../database/local_database/remember_me_database.dart';
import 'autintication_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {

  AuthenticationCubit() : super(AuthenticationInitialState());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  ///////////variables///////////////

  bool isLoginSecure = true;
  bool isSignUpSecure = true;

  ///////////methods////////////////

  void toggleLoginEyesOfPassword() {
    isLoginSecure = !isLoginSecure;
    emit(LogInPasswordSecurityState());
  }

  void toggleSignUpEyesOfPassword() {
    isSignUpSecure = !isSignUpSecure;
    emit(SignUpPasswordSecurityState());
  }

  void toggleIsRememberMe() {
    isRememberMe = !isRememberMe;
    emit(ToggleIsRememberMeBoxState());
  }

  UserDataModel? userDataModel;

  Future<void> userLogin({
    required email,
    required password,
    required BuildContext context,
  }) async{
    emit(AuthenticationLoadingState());
    DioHelper.postData(url: EndPoints.signIn, data: {
      "password": password,
      "email": email,
    }).then((value)async {

      userDataModel = UserDataModel.formJson(value.data);
      token = userDataModel!.data!.accessToken.toString();

        ProfileCubit.get(context).getUserData();
        GeneralLavieCubit.get(context).getProducts();
        GeneralLavieCubit.get(context).getAllBlogs();
      emit(AuthenticationSuccessState(userDataModel));
    }).onError((DioError error, stackTrace) {
        debugPrint(
            "Error When user SignUp :${error.response!.data["message"][0]}");
        emit(AuthenticationErrorState(error.response!.data["message"].toString()));
      });
  }
  void getLoginDataFromDataBase(){
    AppControllers.logInEmailController.text =database!.get("email") ?? "";
    AppControllers.logInPasswordController.text =database!.get("password")??"";
    isRememberMe =database!.get("isRemember")??false;
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


  // void userLoginWithGoogle({
  //   required email,
  //   required password,
  //   required BuildContext context,
  // }) {
  //   emit(AuthenticationLoadingState());
  //   DioHelper.postData(url: EndPoints.signIn, data: {
  //     "password": password,
  //     "email": email,
  //   }).then((value) {
  //     userDataModel = UserDataModel.formJson(value.data);
  //     emit(AuthonticationSuccessState(userDataModel));
  //   }).onError((DioError error, stackTrace) {
  //     debugPrint(
  //         "Error When user SignUp :${error.response!.data["message"][0]}");
  //     emit(AuthonticationErrorState(error.response!.data["message"].toString()));
  //   });


  void userSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) {
    emit(AuthenticationLoadingState());
    if (password == confirmPassword) {
      DioHelper.postData(url: EndPoints.signUp, data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      }).then((value) {

          userDataModel = UserDataModel.formJson(value.data);
          token = userDataModel!.data!.accessToken.toString();

          ProfileCubit.get(context).getUserData();
          GeneralLavieCubit.get(context).getProducts();
          GeneralLavieCubit.get(context).getAllBlogs();
        emit(AuthenticationSuccessState(userDataModel));
      }).onError((DioError error, stackTrace) {
        debugPrint(
            "Error When user SignUp :${error.response!.data["message"][0]}");
        emit(AuthenticationErrorState(error.response!.data["message"].toString()));
      });
    } else {
      Alarm.flutterToast(
        massage: "passwords not the same",
        toastState: ToastState.warning,
      );
      emit(AuthenticationErrorState("passwords not the same"));
    }
  }

}

