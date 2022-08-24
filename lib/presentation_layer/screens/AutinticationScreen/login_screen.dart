import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_cubit.dart';
import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/default_text_form_field.dart';
import 'package:lavie/presentation_layer/shared/component/defualt_text_button.dart';
import 'package:lavie/presentation_layer/shared/constant/constant.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import 'package:lavie/presentation_layer/shared/widget/login_with_facebook_or_google.dart';

import '../../../data_layer/database/local_database/remember_me_database.dart';


var formKey = GlobalKey<FormState>();

Widget loginScreen({
  required BuildContext context,
  required bool isPasswordObSecure,
  required onTapOnSecureEye,
  required onFieldSubmitted,
  required onTapOnforgotPassword,
}) {
  var cubit = AuthenticationCubit.get(context);

  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: 40.w,
      end: 40.w,
      top: 20.h,
    ),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller:AppControllers.logInEmailController,
              keyboardType: TextInputType.emailAddress,
              formBorderRadius: 7,
              istextUpTextField: true,
              textUpTextField: "Email",
              validate: (value) {
                if (value == "") {
                  return "Please Enter your email";
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: AppControllers.logInPasswordController,
              keyboardType: TextInputType.emailAddress,
              istextUpTextField: true,
              textUpTextField: "Password",
              formBorderRadius: 5,
              obSecureText: isPasswordObSecure,
              suffixIcon: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: onTapOnSecureEye,
                icon: isPasswordObSecure
                    ? Icon(
                        Icons.visibility,
                        color: Theme.of(context).iconTheme.color,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).iconTheme.color,
                      ),
              ),
              onFieldSubmitted: onFieldSubmitted,
              validate: (value) {
                if (value == "") {
                  return "Please Enter your Password";
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isRememberMe,
                      checkColor: ColorManager.white,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        cubit.toggleIsRememberMe();
                      },
                    ),
                    Text(
                      "Remember me",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                CustomTextButton(
                  onTap: onTapOnforgotPassword,
                  buttonLabel: "Forget Password ?",
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            cubit.state is AuthenticationLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : DefaultButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        cubit.userLogin(
                          email: AppControllers.logInEmailController.text,
                          password: AppControllers.logInPasswordController.text,
                          context: context,
                        ).then((value){
                          if(isRememberMe){
                            insertBoxToDataBase(
                                email:AppControllers.logInEmailController.text,
                                password:AppControllers.logInPasswordController.text,
                               isRemember: isRememberMe,
                            );

                          }else{
                            Future.delayed(const Duration(seconds: 5)).then((value) {
                               database!.clear();
                               AppControllers.logInEmailController.clear();
                               AppControllers.logInPasswordController.clear();
                            });

                          }
                        });
                      }
                    },
                    label:"Login",
                    labelStyle: Theme.of(context).textTheme.button,
                    buttonColor: Theme.of(context).primaryColor,
                    borderRadius: 5,
                    height: 50,
                  ),


            signInWithFaceBookOrGoogle(
              context: context,
              loginWithGoogle: () {

              },
              loginWithFacebook: () {

                            },
            ),
          ],
        ),
      ),
    ),
  );
}


