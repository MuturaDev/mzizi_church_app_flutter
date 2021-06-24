import 'package:flutter/material.dart';

class Designs {
  static ThemeData darkTheme = getDarkTheme();

  static TextTheme darkTextTheme =
      TextTheme(body2: TextStyle(color: Colors.white70, fontSize: 18.0));

  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey.shade100,
  );

  static ThemeData getDarkTheme() {
    ThemeData darkTheme = ThemeData.light(); //whole text
    return darkTheme.copyWith(
      primaryColor: Color(0xFF487890),
      textSelectionColor: Colors.green,
      textSelectionHandleColor: Colors.white,
      textTheme: darkTheme.textTheme.copyWith(
        body2: darkTheme.textTheme.body2.copyWith(
          //scripture text
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        display1: darkTheme.textTheme.display1.copyWith(
          //
          color: Colors.black,
          fontSize: 22.0,
        ),
        title: darkTheme.textTheme.title.copyWith(
          color: darkTheme.primaryColor,
        ),
      ),
      iconTheme: darkTheme.iconTheme
          .copyWith(color: Colors.black), //Dashboard, bottom navigation icons
      buttonColor: Colors.blue.shade900,
      accentColor: Colors.blue.shade900,
    );
  }
}
