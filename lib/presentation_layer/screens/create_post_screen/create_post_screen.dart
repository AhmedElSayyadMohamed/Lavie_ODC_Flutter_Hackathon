import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/component/default_text_form_field.dart';

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
     body: Padding(
       padding:  EdgeInsets.symmetric(
           horizontal: MediaQuery.of(context).size.width*0.08,
           vertical:MediaQuery.of(context).size.height*0.045, ),
       child: SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               width: MediaQuery.of(context).size.width*0.4,
               height: MediaQuery.of(context).size.height*0.2,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Theme.of(context).primaryColor),
               ),
               child: InkWell(
                   radius:20,
                 onTap: (){},
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(
                       Icons.add,
                       color: Theme.of(context).primaryColor,),
                    const SizedBox(
                       height: 10,
                     ),
                     Text("Add photo",style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Theme.of(context).primaryColor,
                     ),),
                   ],
                 ),
               ),
             ),
             SizedBox(
               height: MediaQuery.of(context).size.height*0.04,
             ),
             CustomTextFormField(
                 keyboardType: TextInputType.text,
                 istextUpTextField:true,
                 textUpTextField: "Title",

                 formBorderRadius:7 ,
             ) ,
              SizedBox(
             height: MediaQuery.of(context).size.height*0.04,
           ),
             CustomTextFormField(
                 keyboardType: TextInputType.text,
                 istextUpTextField:true,
                 textUpTextField: "Description",
                 expand: true,
                 maxline: 5,
                 formBorderRadius:5 ,
             ),
             SizedBox(
               height: MediaQuery.of(context).size.height*0.05,
             ),

             DefaultButton(
                 onTap: (){},
               label:"Post",
               labelStyle: Theme.of(context).textTheme.button,
               buttonColor: Theme.of(context).primaryColor,
               borderRadius: 10,
             ),
           ],
         ),
       ),
     ),
   );
  }


}