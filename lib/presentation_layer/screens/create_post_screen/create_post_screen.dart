import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';

class CreatePostScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       leading: IconButton(
         padding: EdgeInsets.zero,
         splashRadius: 30,
         onPressed: () {
           Navigation.navigatorBack(context: context);
         },
         icon: const Icon(Icons.arrow_back_ios),
       ),
       title: Text("Create New Post",
         style: Theme.of(context).appBarTheme.titleTextStyle,
       ),
     ),
     body: Column(
       children: [],
     ),
   );
  }


}