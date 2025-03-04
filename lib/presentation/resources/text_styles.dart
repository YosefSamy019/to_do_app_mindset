import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle appBarTitle(BuildContext? context) => getBoldStyle(
        color: AppColors.black,
        fontSize: FontSize.s20,
      );

  static TextStyle baseStatesMessageTextStyle(BuildContext? context) =>
      getBoldStyle(
        color: AppColors.white,
        fontSize: FontSize.s24,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext? context) =>
      getBoldStyle(
        color: AppColors.pink,
        fontSize: FontSize.s24,
      );

  static TextStyle taskStyle(BuildContext? context) => getSemiBoldStyle(
        color: AppColors.black,
        fontSize: FontSize.s15,
      );

  static TextStyle taskTitle(BuildContext? context) => getSemiBoldStyle(
        color: AppColors.black,
        fontSize: FontSize.s15,
      );

  static TextStyle taskDesc(BuildContext? context) => getRegularStyle(
        color: AppColors.black,
        fontSize: FontSize.s15,
      );

  static TextStyle circleAvatarStyle(BuildContext? context) => getBoldStyle(
        color: AppColors.primary,
        fontSize: FontSize.s15,
      );
}
