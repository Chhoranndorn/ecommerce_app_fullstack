import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Kantumruy Pro', //'Roboto',
  primaryColor: const Color(0xff20409A), //const Color(0xffC21E56),
  secondaryHeaderColor: const Color(
      0xFF84C341), //const Color(0xffC21E56),//(0xffFF4F8B),//(0xFF3D44E9),//(0xFFFFA800),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFFBCBCBC), //const Color(0xFF9F9F9F),
  highlightColor: Colors.white,
  // cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xffC21E56))),
  colorScheme: const ColorScheme.light(
          primary: Color(0xffC21E56), secondary: Color(0xffC21E56))
      .copyWith(error: const Color(0xFFE84D4F)),
);
