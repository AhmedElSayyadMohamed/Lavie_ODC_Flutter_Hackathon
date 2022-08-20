import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/application_layer/routes_manager.dart';
import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_cubit.dart';
import 'package:lavie/data_layer/bloc/AutinticationCubit/autintication_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/screens/AutinticationScreen/register_screen.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/screens/AutinticationScreen/login_screen.dart';
import 'package:lavie/presentation_layer/shared/component/flutter_toast.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthonticationCubit, AuthonticationStates>(
      listener: (BuildContext context, state) {
        if (state is AuthonticationSuccessState) {
          CachHelper.setData(
            value: state.userDataModel!.data!.accessToken,
            key: "token",
          ).then((value) {
            Navigation.navigateAndFinish(
              context: context,
              navigatorTo: Routes.layoutRoute,
            );
          }).catchError((error) {
            debugPrint("error when save token to cach :${error.toString()}");
          });
        } else if (state is AuthonticationErrorState) {
          Alarm.flutterToast(
              massage: state.error.toString(), toastState: ToastState.error);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = AuthonticationCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Image(
                        image: AssetImage(AssetsManager.leaves),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Image(
                          image: AssetImage(AssetsManager.leaves),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 176.h,
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal:163.w),
                      child: Image.asset(AssetsManager.appLogo),
                    ),
                    SizedBox(
                      height: 74.h,
                    ),
                    Expanded(
                      child: DefaultTabController(
                        initialIndex: 1,
                        length: 2,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              physics: const BouncingScrollPhysics(),
                              labelColor: Theme.of(context).primaryColor,
                              unselectedLabelColor: ColorManager.grey,
                              indicatorColor: Theme.of(context).primaryColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelStyle:Theme.of(context).textTheme.bodyText2,
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'Sign Up',
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Login',
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  signUpWidget(
                                    context: context,
                                    isPasswordObSecure: cubit.isSignUpSecure,
                                    onTapOnSecureEye: () {
                                      cubit.toggelSignUpEyesOfPassword();
                                    },
                                    onFieldSubmitted: (value) {},
                                    onTapOnforgotPassword: () {},
                                  ),
                                  loginWidget(
                                    context: context,
                                    isPasswordObSecure: cubit.isloginSecure,
                                    onTapOnSecureEye: () {
                                      cubit.toggelLoginEyesOfPassword();
                                    },
                                    onFieldSubmitted: (value) {},
                                    onTapOnforgotPassword: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
