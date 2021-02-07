import 'dart:ui';

import 'package:flutter/material.dart';

int sizeModifier = 0;

List<ThemeData> getThemes() {
  return [
    _themeLight,
    _themeDark,
  ];
}

ThemeData _themeDark = ThemeData(
    tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.white54, width: 3.0))
    ),
    labelColor: Colors.white54,
    unselectedLabelColor: Colors.white38,
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  ),
  dividerTheme: DividerThemeData(
    color: Color.fromRGBO(200, 200, 200, 1),
  ),
  bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Color.fromRGBO(60, 60, 60, 0.9)),
  brightness: Brightness.dark,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        color: Colors.white54,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 1.7), //Main body text
    bodyText2: TextStyle(
        color: Color.fromRGBO(238, 166, 100, 1),
        fontSize: 18.0,
        height: 1.6,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic), //quote
    headline1: TextStyle(
        color: Colors.white70, fontSize: 14.0, fontWeight: FontWeight.w600),
    headline2: TextStyle(
        decoration: TextDecoration.underline,
        height: 2.0,
        color: Colors.white70,
        fontSize: 16.0,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
    //for Page-menu
    headline4: TextStyle(
        color: Colors.white70, fontSize: 24.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
    subtitle1: TextStyle(
        color: Colors.white70,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic),
    subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic),
    caption: TextStyle(
        color: Colors.white24,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    button: TextStyle(
        color: Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w600),
  ),
  buttonColor: Color.fromRGBO(50, 50, 50, 1),
  backgroundColor: Color.fromRGBO(32, 32, 32, 1),
  canvasColor: Color.fromRGBO(30, 30, 30, 0.8),
  accentColor: Color.fromRGBO(40, 40, 40, 1),
  primaryColor: Colors.black,
);

ThemeData _themeLight = ThemeData(
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black87, width: 3.0))
    ),
    labelColor: Colors.black87,
    unselectedLabelColor: Colors.black38,
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  ),
  dividerTheme: DividerThemeData(
    color: Color.fromRGBO(70, 70, 70, 1),
  ),
  bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Colors.white.withOpacity(0.9)),
  brightness: Brightness.light,
  textTheme: TextTheme(
    bodyText1: TextStyle(
        color: Color.fromRGBO(65, 65, 65, 1),
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 1.8), //Main body text
    bodyText2: TextStyle(
        color: Color.fromRGBO(146, 79, 46, 1),
        fontSize: 18.0,
        height: 1.6,
        fontStyle: FontStyle.italic), //quote
    headline1: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 14.0,
        fontWeight: FontWeight.w600),
    headline2: TextStyle(
        height: 2.0,
        decoration: TextDecoration.underline,
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 16.0,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 18.0,
        fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
    // Page-menu
    headline4: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 24.0,
        fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
    subtitle1: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic),
    subtitle2: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic),
    caption: TextStyle(
        color: Color.fromRGBO(80, 80, 80, 0.6),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    button: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontSize: 18.0,
        fontWeight: FontWeight.w600),
  ),
  buttonColor: Color.fromRGBO(230, 230, 230, 1),
  backgroundColor: Color.fromRGBO(245, 245, 245, 1),
  canvasColor: Colors.white.withOpacity(0.8),
  accentColor: Color.fromRGBO(240, 240, 240, 1),
  primaryColor: Colors.white,
);
