import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Kantumruy Pro', //'Roboto',
  primaryColor:
      const Color(0xffFFFFFF), //const Color(0xffC21E56),//(0xFFE52E04),
  secondaryHeaderColor: const Color(
      0xffFFFFFF), //const Color(0xffC21E56), //(0xFF3D44E9), //(0xFFFFA800),//(0xffFF4F8B),
  disabledColor: const Color(0xFF6f7275),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  highlightColor: Colors.black,
  // cardColor: Colors.black,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xffC21E56))),
  colorScheme: const ColorScheme.dark(
          primary: Color(0xffC21E56), secondary: Color(0xffC21E56))
      .copyWith(error: const Color(0xFFdd3135)),
);
