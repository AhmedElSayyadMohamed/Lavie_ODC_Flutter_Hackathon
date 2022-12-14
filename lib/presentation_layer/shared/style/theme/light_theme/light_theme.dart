import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: ColorManager.primary,
  backgroundColor: ColorManager.white,
  scaffoldBackgroundColor:ColorManager.white ,
  textTheme: TextTheme(

    headline1:GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorManager.black,
    ) ,
    headline2:GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ColorManager.black,
    ) ,
    headline3:GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorManager.grey,
    ),
    headline4:GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorManager.black,
    ),
    headline5:GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorManager.black,
    ),
    headline6:GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorManager.black,
    ),

    subtitle1:GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorManager.lightGrey,
    ),
    subtitle2:GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorManager.lightGrey,
    ),

    bodyText1: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorManager.grey,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: ColorManager.midGrey,
    ),

    button: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
      ),
    caption: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorManager.primary,
    ),
   ),
  iconTheme: IconThemeData(
    size: 30,
    color: ColorManager.midGrey,
  ),
  dividerTheme: DividerThemeData(
    color: ColorManager.whiteAccent,
  ),
  cardTheme: CardTheme(
    color: ColorManager.white,
    // shadowColor: Colors.blueAccent,
    elevation: 5,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: ColorManager.white,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: ColorManager.black,
    ),
    centerTitle: true,
  iconTheme: IconThemeData(
    size: 25,
    color: ColorManager.grey,
  )
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorManager.primary,
  )
);
