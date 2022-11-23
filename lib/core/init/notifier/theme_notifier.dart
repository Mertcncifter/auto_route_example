import 'package:flutter/material.dart';

import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier {
  ThemeData? _currentTheme = AppThemeLight.instance?.theme;
  ThemeData? get currentTheme => _currentTheme;
  ThemeData? get lightTheme => AppThemeLight.instance?.theme;
  ThemeData? get darkTheme => AppThemeDark.instance?.theme;
}
