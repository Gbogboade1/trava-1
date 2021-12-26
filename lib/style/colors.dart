import 'package:flutter/material.dart';

class TravaColors {
  static const MaterialColor primary = MaterialColor(
    0xFF982C31,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFF051C3F,
    <int, Color>{
      50: Color.fromRGBO(77, 59, 145, 0.1),
      100: Color.fromRGBO(77, 59, 145, 0.2),
      200: Color.fromRGBO(77, 59, 145, 0.3),
      300: Color.fromRGBO(77, 59, 145, 0.4),
      400: Color.fromRGBO(77, 59, 145, 0.5),
      500: Color.fromRGBO(77, 59, 145, 0.6),
      600: Color.fromRGBO(77, 59, 145, 0.7),
      700: Color.fromRGBO(77, 59, 145, 0.8),
      800: Color.fromRGBO(77, 59, 145, 0.9),
      900: Color.fromRGBO(77, 59, 145, 1),
    },
  );

  static const Color transparent = Color(0x00000000);
  static const Color bg = Color(0xFFF1C37E);
  static const Color purple = Color(0xFF4D3B91);
  static const Color purpleLight = Color(0xFF5166FF);
  static const Color purplePale = Color(0xFFF2EFFF);
  static const Color purplePaleDark = Color(0xFFE8E2FF);
  static const Color gray = Color(0xFFE0E0E0);
  static const Color gray3 = Color(0xFF828282);
  static const Color darkGray = Color(0xFF8A8A8F);
  static const Color grayBorder = Color(0xFFEFEFEF);
  static const Color grayBtn = Color(0xFFF3F3F3);
  static const Color grayScaffold = Color(0xFFE5E5E5);
  static const Color blue = Color(0xFF17123B);
  static const Color navy = Color(0xFF03435F);
  static const Color lightGreen = Color(0xFFE4F6EB);
  static const Color blueSky = Color(0xFFE9F3FF);
  static const Color blueBorder = Color(0xFF007AFF);
  static const Color yellow = Color(0xFFFFE3AC);
  static const Color yellowLight = Color(0xFFFFF2E6);
  static const Color yellowDark = Color(0xFFF2994A);
  static const Color yellowPale = Color(0xFFFFF6DB);
  static const Color yellowPaleDark = Color(0xFFFFEEBB);
  static const Color lightRed = Color(0xFFFCD7D7);
  static const Color red = Color(0xFFF35656);
  static const Color redLight = Color(0xFFFEB9B9);
  static const Color velvet = Color(0xFFCB2026);
  static const Color lightPurple = Color(0xFFF3F0FF);
  static const Color pink = Color(0xFFFFDDFC);
  static const Color green = Color(0xFF4CAF50);
  static const Color greenPale = Color(0xFFDEFFEC);
  static const Color greenPaleDark = Color(0xFFB9FFD7);
  static const Color greenDark = Color(0xFF219653);
  static const Color greenLight = Color(0xFF7DE0A8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF171718);
  static const Color divider = Color(0xFFDADADA);
  static const Color dividerDark = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF656F78);
  static const Color lightGrey = Color(0xff666666);
  static const Color wine = Color(0xFF982C31);
  static const purpleGradient = LinearGradient(
    colors: [
      Color(0xFF2C1B68),
      Color.fromRGBO(66, 27, 104, 0.85),
    ],
    stops: [
      0,
      1.14,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
