import 'package:flutter/material.dart';

class ProfileCardItem extends StatelessWidget{

   final String editLogo;
   final String label;
   final TextStyle? labelStyle;
   final Color backgroundColor;
   final Color borderColor;
   final double borderRadius ;
   final bool isButton;

  const ProfileCardItem({Key? key,
    required this.editLogo,
    required this.label,
    this.labelStyle,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
    this.isButton =false }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  Container(
     padding:const EdgeInsetsDirectional.all(15),
     width: double.infinity,
     height:MediaQuery.of(context).size.height*0.1,
     decoration: BoxDecoration(
       color: backgroundColor,
       borderRadius: BorderRadius.circular(borderRadius),
       border:Border.all(
         color: borderColor,
       ),
     ),
     child: Row(
       children: [
         Image.asset(editLogo),
         const SizedBox(
           width: 10,
         ),
         Text(
           label,
           style: labelStyle,
         ),
         const Spacer(),
         isButton?
         const Icon(Icons.arrow_forward)
             :const SizedBox(),
       ],
     ),
   );
  }
}