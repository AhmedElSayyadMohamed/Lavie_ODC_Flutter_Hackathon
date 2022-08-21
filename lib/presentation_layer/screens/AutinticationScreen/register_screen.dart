import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_cubit.dart';
import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/default_text_form_field.dart';
import 'package:lavie/presentation_layer/shared/widget/login_with_facebook_or_google.dart';

var firstUserNameController = TextEditingController();
var lastUserNameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>();

Widget signUpScreen({
  required BuildContext context,
  required isPasswordObSecure,
  required onTapOnSecureEye,
  required onFieldSubmitted,
  required onTapOnforgotPassword,
}) {
  var cubit = AuthonticationCubit.get(context);
  return Padding(
    padding:  EdgeInsetsDirectional.only(
      start: 40.w,
      end: 40.w,
      top: 40.h,
    ),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: firstUserNameController,
                    keyboardType: TextInputType.text,
                    formBorderRadius: 7,
                    istextUpTextField: true,
                    textUpTextField: "FirstName",
                    validate: (value) {
                      if (value == "") {
                        return "Please Enter your FirstName";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormField(
                    controller: lastUserNameController,
                    keyboardType: TextInputType.emailAddress,
                    formBorderRadius: 7,
                    istextUpTextField: true,
                    textUpTextField: "LastName",
                    validate: (value) {
                      if (value == "") {
                        return "Please Enter your Name";
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              formBorderRadius: 7,
              istextUpTextField: true,
              textUpTextField: "Email",
              validate: (value) {
                if (value == "") {
                  return "Please Enter your Email";
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
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
              onFieldSubmitted: (value) {
                if (formKey.currentState!.validate()) {}
              },
              validate: (value) {
                if (value == "") {
                  return "Please Enter your Password";
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ), 
            CustomTextFormField(
              controller: confirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              istextUpTextField: true,
              textUpTextField: "ConfirmPassword",
              obSecureText: isPasswordObSecure,
              formBorderRadius: 5,
              onFieldSubmitted: onFieldSubmitted,
              validate: (value) {
                if (value == "") {
                  return "Please Enter Confirm your Password";
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            cubit.state is AuthonticationLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : DefaultButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        cubit.userSignUp(
                          firstName: firstUserNameController.text,
                          lastName: lastUserNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          context: context,
                        );
                      }
                    },
                    label:  "SignUp",
                    labelStyle: Theme.of(context).textTheme.button,
                    buttonColor: Theme.of(context).primaryColor,
                    borderRadius: 5,
                    height: 50,
                  ),
             SizedBox(
              height: 10.h,
            ),
          signInWithFaceBookOrGoogle(
              context: context,
               loginWithGoogle: (){},
                loginWithFacebook: (){},
                ),
          ],
        ),
      ),
    ),
  );
}
