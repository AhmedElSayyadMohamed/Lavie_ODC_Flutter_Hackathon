import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/application_layer/application.dart';
import 'package:lavie/data_layer/bloc/bloc_observer/bloc_observer.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/presentation_layer/shared/constant/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachHelper.init();
  token = CachHelper.getData(key: "token") ?? "";
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: SimpleBlocObserver());
}
