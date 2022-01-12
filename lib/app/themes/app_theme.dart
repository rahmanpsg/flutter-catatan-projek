import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get basic => ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: primaryColor,
        ),
        splashColor: secondaryColor,
        fontFamily: 'Signika',
        appBarTheme: AppBarTheme(
          titleTextStyle: kHeaderStyle,
          iconTheme: IconThemeData(color: secondaryColor),
        ),
      );
}