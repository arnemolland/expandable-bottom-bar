import 'package:flutter/material.dart';

class FlutterDark {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        elevation: 2.0,
      ),
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(39, 59, 89, 1),
      ),
      canvasColor: Color.fromRGBO(25, 39, 62, 1),
      backgroundColor: Color.fromRGBO(31, 50, 69, 1),
      bottomAppBarColor: Color.fromRGBO(39, 59, 89, 1),
      buttonColor: Colors.deepOrange,
      indicatorColor: Colors.deepOrange,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
          ),
    );
  }
}
