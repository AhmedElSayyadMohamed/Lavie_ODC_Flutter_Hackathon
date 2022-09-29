import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Color?  backgroundColor;
  final List<Widget>? action;
  final bool isBackButton;
  final String? title;
  const CustomAppBar({
    Key? key,
    this.backgroundColor,
    this.action,
    this.isBackButton =false,
    this.title ='',
  }): super(key: key);

  @override
  final Size preferredSize =const Size(5, 55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton? const BackButton():const SizedBox.shrink(),
      title: Text(title!,style:Theme.of(context).appBarTheme.titleTextStyle,),
      backgroundColor: backgroundColor??Theme.of(context).scaffoldBackgroundColor,
      actions: action,
    );
  }
}