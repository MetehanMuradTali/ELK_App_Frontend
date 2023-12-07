import 'package:elk_frontend/production/others/decorations/custom_radiuses.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';

class DDWidget extends StatelessWidget {
  const DDWidget(
      {super.key, required this.callback, required this.selectedColumn,required this.items});
  final dynamic callback;
  final String selectedColumn;
  final List<DropdownMenuItem<dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
          borderRadius: CustomRadiuses.mainBorderR,
          dropdownColor: MainColors.color3,
          underline: const Text(""),
          style: MainStyles.greenHeaderStyle,
          icon: const Icon(Icons.sort),
          items: items,
          value: selectedColumn,
          onChanged: onItemChanged),
    );
  }

  onItemChanged(newValue) {
    callback(newValue);
  }
}
