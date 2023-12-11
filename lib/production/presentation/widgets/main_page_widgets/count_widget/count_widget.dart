import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        int resultCount = 0;
        switch (state.currentState) {
          case SearchingStates.success:
            resultCount = state.totalResultCount;
          default:
        }
        return Container(
          decoration: CustomBoxDecorations.outsideBoxDecor,
          padding: CustomPaddings.mainPadding,
          width: 250,
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceAround,
            spacing: MainDoubles.wrapSpacing1,
            children: [
              const Icon(Icons.circle, color: MainColors.color3),
              Text(
                CountWidgetStrings.totalCount,
                style: MainStyles.whiteHeaderStyle,
              ),
              Text(resultCount.toString(), style: MainStyles.whiteHeaderStyle),
            ],
          ),
        );
      },
    );
  }
}
