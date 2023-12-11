import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainStyles {
  static TextStyle greenStyle = GoogleFonts.roboto(color: MainColors.color1);
  static TextStyle whiteStyle = GoogleFonts.roboto(
    color: MainColors.color3,
  );

  static TextStyle greenHeaderStyle = GoogleFonts.roboto(
      color: MainColors.color1, fontSize: MainDoubles.headerFontSize);
  static TextStyle whiteHeaderStyle = GoogleFonts.roboto(
    color: MainColors.color3,
    fontWeight: FontWeight.w700,
    fontSize: MainDoubles.headerFontSize,
  );
}

class FormWidgetStyles {
  static const ButtonStyle searchBtnStyle = ButtonStyle(
    elevation: MaterialStatePropertyAll(10),
    backgroundColor: MaterialStatePropertyAll(MainColors.color3),
  );
}
