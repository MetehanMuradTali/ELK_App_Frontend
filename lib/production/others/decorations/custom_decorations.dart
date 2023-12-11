import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/custom_radiuses.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';

class CustomBoxDecorations {
  static BoxDecoration outsideBoxDecor = const BoxDecoration(
      color: MainColors.color1,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 1,
          spreadRadius: 1,
          color: Colors.black38,
        )
      ]);
  static BoxDecoration ddWidgetOutsideDecor = BoxDecoration(
      color: MainColors.color3,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.white));
}

class FormWidgetDecorations {
  static const InputDecoration textFormDecoration = InputDecoration(
      hintText: FormWidgetStrings.textFieldHint,
      hintStyle: TextStyle(color: MainColors.color2),
      prefixIcon: Icon(Icons.manage_search_outlined),
      fillColor: MainColors.color3,
      filled: true,
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: CustomRadiuses.mainBorderR));
}

class SearchWidgetDecorations {
  static BoxDecoration searchTableDecor = const BoxDecoration(boxShadow: [
    BoxShadow(
      offset: Offset(0, 0),
      blurRadius: 1,
      spreadRadius: 1,
      color: Colors.black26,
    )
  ]);
}
