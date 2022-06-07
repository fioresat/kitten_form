import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.deepPurple,
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      //fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.pink,
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.all(15),
        elevation: 4,
        color: Colors.transparent,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          //side: BorderSide(color: Colors.deepPurple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple, errorColor: Colors.white)
            .copyWith(
                //secondary: const Color(0xFF673AB7),
                // primary: const Color(0xFFeeeeee),
                // onPrimary: const Color(0xFFeeeeee),
                brightness: Brightness.dark),

        // textTheme: ThemeData.dark().textTheme,

        cardTheme: CardTheme(
          margin: EdgeInsets.all(15),
          elevation: 4,
          color: Colors.transparent,
          shadowColor: Colors.white10,
          shape: RoundedRectangleBorder(
            //side: BorderSide(color: Colors.deepPurple, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        ));
  }
}
