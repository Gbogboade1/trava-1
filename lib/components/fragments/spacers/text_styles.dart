import 'package:flutter/widgets.dart' show TextStyle, FontWeight;
import 'package:google_fonts/google_fonts.dart';

class TravaFonts {
  ///
  /// FONT-FAMILY MARK PRO
  ///
  static const markPro = "MarkPro";
}

class TravaTextStyle {
  static TextStyle light = GoogleFonts.poppins(
    fontWeight: FontWeight.w100,
  );

  static TextStyle medium = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle black = GoogleFonts.poppins(
    fontWeight: FontWeight.w900,
  );
}
