import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class KTextStyle {
  KTextStyle._();
  static String? _primaryFontFamily = GoogleFonts.ibmPlexSerif().fontFamily;

  static TextStyle title({Color color = KGRAYCOLOR, double fontSize = 85, FontWeight fontWeight = FontWeight.w900, String? fontfamily}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontfamily == null ? _primaryFontFamily : fontfamily,
    );
  }

  static TextStyle body({Color color = KLIGHTGRAYCOLOR, double fontSize = 45, FontWeight fontWeight = FontWeight.w400, String? fontfamily}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontfamily == null ? _primaryFontFamily : fontfamily,
    );
  }
}
