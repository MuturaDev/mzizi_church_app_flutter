import 'package:flutter/material.dart';

class Designs {
  static ThemeData darkTheme = getDarkTheme();

  static TextTheme darkTextTheme =
      const TextTheme(bodyLarge: TextStyle(color: Colors.white70, fontSize: 18.0));

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey.shade100,
  );

  static ThemeData getDarkTheme() {
    // Material 2, to keep the look the app had on Flutter 3.0.
    ThemeData darkTheme = ThemeData.light(useMaterial3: false); //whole text
    return darkTheme.copyWith(
      primaryColor: const Color(0xFF487890),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.green,
        selectionHandleColor: Colors.white,
      ),
      textTheme: darkTheme.textTheme.copyWith(
        bodyLarge: darkTheme.textTheme.bodyLarge!.copyWith(
          //scripture text
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        headlineMedium: darkTheme.textTheme.headlineMedium!.copyWith(
          //
          color: Colors.black,
          fontSize: 22.0,
        ),
        titleLarge: darkTheme.textTheme.titleLarge!.copyWith(
          color: darkTheme.primaryColor,
        ),
      ),
      iconTheme: darkTheme.iconTheme
          .copyWith(color: Colors.black), //Dashboard, bottom navigation icons
      colorScheme: darkTheme.colorScheme.copyWith(secondary: Colors.blue.shade900),
    );
  }
}
