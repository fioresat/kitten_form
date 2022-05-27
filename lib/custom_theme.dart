import 'package:flutter/material.dart';

//import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.pink,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple, errorColor: Colors.white)
            .copyWith(
                secondary: const Color(0xFF673AB7),
                primary: const Color(0xFF673AB7),
                onPrimary: const Color(0xFFeeeeee),
                brightness: Brightness.dark),

        // textTheme: ThemeData.dark().textTheme,

        cardTheme: CardTheme(
          margin: EdgeInsets.all(15),
          elevation: 4,
          color: Colors.transparent,
          shadowColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            //side: BorderSide(color: Colors.deepPurple, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.pink,
        ));
  }
}
