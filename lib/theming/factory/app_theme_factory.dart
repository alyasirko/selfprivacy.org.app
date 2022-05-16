import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_theme/system_theme.dart';
import 'package:gtk_theme_fl/gtk_theme_fl.dart';

abstract class AppThemeFactory {
  AppThemeFactory._();

  static Future<ThemeData> create(
      {required bool isDark, required Color fallbackColor}) {
    return _createAppTheme(
      isDark: isDark,
      fallbackColor: fallbackColor,
    );
  }

  static Future<ThemeData> _createAppTheme({
    bool isDark: false,
    required Color fallbackColor,
  }) async {
    ColorScheme? gtkColorsScheme;
    var brightness = isDark ? Brightness.dark : Brightness.light;

    final dynamicColorsScheme = await _getDynamicColors(brightness);

    if (Platform.isLinux) {
      GtkThemeData themeData = await GtkThemeData.initialize();
      gtkColorsScheme = ColorScheme.fromSeed(
        seedColor: Color(themeData.theme_selected_bg_color),
        brightness: Color(themeData.theme_base_color).computeLuminance() > 0.5
            ? Brightness.light
            : Brightness.dark,
        background: Color(themeData.theme_bg_color),
        surface: Color(themeData.theme_base_color),
      );
    }

    final accentColor = await SystemAccentColor(fallbackColor)
      ..load();

    final fallbackColorScheme = ColorScheme.fromSeed(
      seedColor: accentColor.accent,
      brightness: brightness,
    );

    final colorScheme = dynamicColorsScheme ?? gtkColorsScheme ?? fallbackColorScheme;

    final appTypography = Typography.material2021();

    final materialThemeData = ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      typography: appTypography,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );

    return materialThemeData;
  }

  static Future<ColorScheme?> _getDynamicColors(Brightness brightness) {
    try {
      return DynamicColorPlugin.getCorePalette().then(
          (corePallet) => corePallet?.toColorScheme(brightness: brightness));
    } on PlatformException {
      return Future.value(null);
    }
  }
}
