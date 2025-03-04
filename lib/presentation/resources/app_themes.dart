import 'package:flutter/material.dart';
import 'package:to_do_mindset/presentation/resources/app_colors.dart';
import 'package:to_do_mindset/presentation/resources/text_styles.dart';

ThemeData? getApplicationTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppTextStyles.appBarTitle(context),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.tertiary,
    )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.tertiary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.tertiary,
    ),
    listTileTheme: ListTileThemeData(iconColor: AppColors.primary),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
    ),
  );
}

ThemeData? getApplicationDarkTheme(BuildContext context) {
  return null;
}
