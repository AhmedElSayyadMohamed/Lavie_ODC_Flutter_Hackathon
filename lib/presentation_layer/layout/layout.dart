import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/shared/widget/bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {

  const LayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralLavieCubit, GeneralLavieStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = GeneralLavieCubit.get(context);
        return Scaffold(
          bottomNavigationBar:CustomBottomNavigationBar(
            currentBottomNavBarIndex: cubit.currentBottomNavIndex,
            onTap: (index) {
              cubit.changeBottomNavBarIndex(index: index,context: context);
            },
          ),
          body: cubit.screen[cubit.currentBottomNavIndex],
        );
      },
    );
  }
}
