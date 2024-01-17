import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/style/icon/custom_icon.dart';
import 'package:lavie/presentation_layer/shared/style/icon/icon_broken.dart';


class CustomBottomNavigationBar extends StatelessWidget{

   final int currentBottomNavBarIndex;
   final void Function(int)? onTap;
   const CustomBottomNavigationBar({Key? key,
   required this.currentBottomNavBarIndex,
   required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Material(
     elevation: 20,
     child: CurvedNavigationBar(
       color: Theme.of(context).backgroundColor,
       backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
       buttonBackgroundColor: Theme.of(context).primaryColor,
       animationCurve: Curves.decelerate,
       index:currentBottomNavBarIndex,
       items: const [
         Icon(CustomIcon.leaf),
         Icon(IconBroken.Scan),
         Icon(IconBroken.Home),
         Icon(IconBroken.Notification),
         Icon(IconBroken.Profile),
       ],
       onTap: onTap,
     ),
   );
  }

}
