import 'package:flutter/material.dart';

class MyTheme {
  static Color primeLight = Color(0xffB7935F);
  static Color primeDark = Color(0xff141a2e);
  static Color yellowColor = Color(0xfffacc1d);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xfff8f8f8);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primeLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
        titleMedium: TextStyle(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w500
        ),
        titleSmall: TextStyle(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.w300
        ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,


    )
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: primeDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
        titleMedium: TextStyle(
            color: whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w500
        ),
        titleSmall: TextStyle(
            color: yellowColor,
            fontSize: 25,
            fontWeight: FontWeight.w300
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,


      )
  );
}