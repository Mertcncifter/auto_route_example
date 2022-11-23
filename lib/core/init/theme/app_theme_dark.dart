import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'dark/dark_theme_interface.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;

  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();
    return _instance;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark().copyWith(),
      scaffoldBackgroundColor: colorSchemeDark?.black,
      appBarTheme: AppBarTheme(
        backgroundColor: colorSchemeDark?.black,
      ),
      cardColor: Color(0xff424242),
      shadowColor: null,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // background (button) color
          foregroundColor: Colors.black, // foreground (text) color
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff424242),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff424242),
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff424242),
        )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff424242),
        )),
      ));
}
