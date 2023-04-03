import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/ui_models/ui_colors.dart';

const currentFontFamily = "RobotoMono";

TextStyle styleRegular([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleBold([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
  );
}



TextStyle styleMedium([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
  );
}



TextStyle styleSemiBold([double? fontSize = 12, Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleH3A([Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleH4([Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleH1([Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleH2([Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleH3B([Color? color = cBlack]) {
  return TextStyle(
    color: color,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: currentFontFamily,
  );
}

