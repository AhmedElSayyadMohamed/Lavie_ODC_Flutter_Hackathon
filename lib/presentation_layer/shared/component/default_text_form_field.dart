import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? textFormLabel;
  TextInputType keyboardType;
  double formBorderRadius;
  bool obSecureText;
  Color? borderColor;
  String hint;
  var validate;
  ValueChanged<String>? onFieldSubmitted;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool expand;
  bool isborder;
  bool istextUpTextField;
  String textUpTextField;
  CustomTextFormField({
    Key? key,
    this.controller,
    this.textFormLabel = "",
    required this.keyboardType,
    this.obSecureText = false,
    this.formBorderRadius = 0,
    this.validate,
    this.suffixIcon,
    this.prefixIcon,
    this.hint="",
    this.onFieldSubmitted,
    this.expand = false,
    this.isborder =true,
    this.textUpTextField="",
    this.istextUpTextField=false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
       istextUpTextField? 
         Text(
          textUpTextField,
          style:Theme.of(context).textTheme.bodyText1 ,
          ):const SizedBox(),
         const SizedBox(
            height: 5,
          ),
         TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obSecureText,
          minLines: expand ? null : 1,
          maxLines: expand ? null : 1,
          style:Theme.of(context).textTheme.bodyText1,
          cursorColor:Theme.of(context).primaryColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            isCollapsed: true,
            label: Text(
              textFormLabel!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            hintText: hint,
            labelStyle:  Theme.of(context).textTheme.bodyText1,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            errorStyle:Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.red,
            ),
            border:isborder? OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
              borderRadius:BorderRadius.circular(formBorderRadius),
            ):InputBorder.none,
            focusedBorder:isborder?OutlineInputBorder(
            borderSide:  BorderSide(
              color: Theme.of(context).primaryColor,),
          ):InputBorder.none,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),  
          onFieldSubmitted: onFieldSubmitted,
          validator: validate,
          onChanged: (value){},
        ),
      ],
    );
  }
}
