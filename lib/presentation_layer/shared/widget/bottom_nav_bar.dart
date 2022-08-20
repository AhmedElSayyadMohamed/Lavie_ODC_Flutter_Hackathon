import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/presentation_layer/shared/style/icon/custom_icon.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';

Widget bottomNavBar({
  required BuildContext context,
}) {
  var cubit = GeneralLavieCubit.get(context);
  return Material(
    elevation: 20,
    child: CurvedNavigationBar(
      color: Theme.of(context).backgroundColor,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      buttonBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
      animationCurve: Curves.decelerate,
      index: cubit.currentBottomNavIndex,
      items: const [
        CustomIcon.leaf,
        IconBroken.Scan,
        IconBroken.Home,
        IconBroken.Notification,
        IconBroken.Profile,
      ],
      
      onTap: (index) {
        cubit.changeBottomNavBarIndex(index);
      },
    ),
  );
}
