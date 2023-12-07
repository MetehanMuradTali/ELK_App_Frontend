import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/report_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/dropdown.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  sort(String? newValue) {
    BlocProvider.of<ReportCubit>(context).getTheIPAddresses(newValue!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPaddings.mainPadding,
      decoration: CustomBoxDecorations.outsideBoxDecor,
      child: Container(
          decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
          child: BlocBuilder<ReportCubit, ReportState>(
            builder: (context, state) {
              return DDWidget(
                  callback: sort,
                  items: ReportWidgetList.ddWidgetOptions,
                  selectedColumn: BlocProvider.of<ReportCubit>(context)
                      .state
                      .categoryValue);
            },
          )),
    );
  }
}
