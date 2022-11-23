import 'light/light_theme_interface.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.light().copyWith(),
        scaffoldBackgroundColor: colorSchemeLight?.white,
        appBarTheme: AppBarTheme(
            backgroundColor: colorSchemeLight?.white,
            foregroundColor: colorSchemeLight?.black),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        shadowColor: Colors.grey.withOpacity(0.5),
        cardColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      );
}
