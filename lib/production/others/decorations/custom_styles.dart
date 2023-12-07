import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';

class MainStyles {
  static const TextStyle greenStyle = TextStyle(color: MainColors.color1);
  static const TextStyle whiteStyle = TextStyle(
    color: MainColors.color3,
  );

  static const TextStyle greenHeaderStyle =
      TextStyle(color: MainColors.color1, fontSize: MainDoubles.headerFontSize);
  static const TextStyle whiteHeaderStyle = TextStyle(
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
