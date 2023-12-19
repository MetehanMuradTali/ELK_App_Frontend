import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String headerText;
  final String tooltipText;

  const CustomTooltip(
      {super.key, required this.headerText, required this.tooltipText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          headerText,
          style: MainStyles.whiteHeaderStyle,
        ),
        Container(
          margin: CustomPaddings.mainPadding,
          decoration: const ShapeDecoration(
              color: MainColors.color3, shape: CircleBorder()),
          child: Tooltip(
              message: tooltipText,
              textStyle: MainStyles.whiteHeaderStyle,
              child: const Icon(
                Icons.question_mark_outlined,
                color: Colors.black38,
                size: 16,
              )),
        ),
      ],
    );
  }
}
