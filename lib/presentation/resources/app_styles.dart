import 'package:flutter/material.dart';

import 'app_fonts.dart';

TextStyle _getTextStyle(String? fontFamily, double fontSize,
    FontWeight fontWeight, Color color, List<Shadow>? shadows) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    shadows: shadows,
  );
}

// thin style

TextStyle getThinStyle(
    {fontFamily,
    fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.thin, color, shadows);
}

// extralight style

TextStyle getExtraLightStyle(
    {fontFamily,
    fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.extraLight, color, shadows);
}

// light style

TextStyle getLightStyle(
    {fontFamily,
    fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.light, color, shadows);
}

// regular style

TextStyle getRegularStyle(
    {fontFamily,
    fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.regular, color, shadows);
}

// medium style

TextStyle getMediumStyle(
    {fontFamily,
    double fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.medium, color, shadows);
}

// medium style

TextStyle getSemiBoldStyle(
    {fontFamily,
    double fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.semiBold, color, shadows);
}

// bold style

TextStyle getBoldStyle(
    {fontFamily,
    double fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.bold, color, shadows);
}

// extrabold style

TextStyle getExtraBoldStyle(
    {fontFamily,
    double fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.extraBold, color, shadows);
}

// black style

TextStyle getBlackStyle(
    {fontFamily,
    double fontSize = FontSize.s12,
    required Color color,
    List<Shadow>? shadows}) {
  return _getTextStyle(
      fontFamily, fontSize, FontWeightManager.black, color, shadows);
}
