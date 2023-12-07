import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/sort_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/dropdown.widget.dart';
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
      child: Container(
          decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
          child: DDWidget(
              callback: sort,
              items: MainLists.ddWidgetOptions,
              selectedColumn:
                  BlocProvider.of<SortCubit>(context).state.sortValue)),
    );
  }
}
