import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColor.primColor,
      backgroundColor: AppColor.secColor,
      selectedLabelStyle:
      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),

    ),
    primaryColorLight: AppColor.primColor,
    scaffoldBackgroundColor: Colors.transparent,


    textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.primColor, fontSize: 25)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: AppColor.primColor, fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColor.primColorDark,
      backgroundColor: AppColor.secColorDark,
      selectedLabelStyle:
      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),

    ),
    primaryColorDark: AppColor.primColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.secColorDark, fontSize: 25)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: AppColor.secColorDark,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    ),
  );
}
