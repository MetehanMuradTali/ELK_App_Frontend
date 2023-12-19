import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/presentation/state_manement/search_page_manager/cubit/sort_cubit/sort_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/dropdown.widget.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortWidget extends StatefulWidget {
  const SortWidget({super.key});

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  sort(String? newValue) {
    BlocProvider.of<SortCubit>(context).countTheValues(newValue!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPaddings.mainPadding,
      decoration: CustomBoxDecorations.outsideBoxDecor,
      child: Wrap(
        children: [
          const CustomTooltip(headerText: SortWidgetStrings.headerText, tooltipText: SortWidgetStrings.tooltipText),
          Container(
              decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
              child: DDWidget(
                  callback: sort,
                  items: MainLists.ddWidgetOptions,
                  selectedColumn:
                      BlocProvider.of<SortCubit>(context).state.sortValue)),
        ],
      ),
    );
  }
}
