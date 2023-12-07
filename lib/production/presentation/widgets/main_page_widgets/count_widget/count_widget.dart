import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit.dart';
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
          case SearchingStates.loading:
            resultCount = state.totalResultCount;
          default:
        }
        return Container(
          decoration: CustomBoxDecorations.outsideBoxDecor,
          child: Row(
            children: [
              const Icon(Icons.circle, color: MainColors.color3),
              const SizedBox(width: 5),
              const Text(
                CountWidgetStrings.totalCount,
                style: MainStyles.whiteHeaderStyle,
              ),
              const SizedBox(width: 20),
              Text(resultCount.toString(), style: MainStyles.whiteHeaderStyle),
              const SizedBox(width: 5),
            ],
          ),
        );
      },
    );
  }
}
