import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import '../data_layer/bloc/AutinticationCubit/autintication_cubit.dart';
import 'routes_manager.dart';
import '../presentation_layer/shared/style/theme/light_theme/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          AuthenticationCubit()..getLoginDataFromDataBase(),
        ),
        BlocProvider(
          create: (context) => GeneralLavieCubit()..getUserData(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          initialRoute: Routes.splashRoute,
          onGenerateRoute: RoutGenerator.getRoute,
        );
        },
         designSize:const Size(428, 926) ,
        ),
    );
  }
}
