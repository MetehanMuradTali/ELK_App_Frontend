import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/state_manement/search_page_manager/cubit/report_cubit/report_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/dropdown.widget.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  getIps(String? newValue) {
    BlocProvider.of<ReportCubit>(context).getTheIPAddresses(newValue!);
    setState(() {});
  }

  sendToBackend() {
    BlocProvider.of<ReportCubit>(context).sendToBackend();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: CustomPaddings.mainPadding,
        decoration: CustomBoxDecorations.outsideBoxDecor,
        child: BlocBuilder<ReportCubit, ReportState>(
          builder: (context, state) {
            bool btnState;
            switch (state.currentState) {
              case ReportStates.success:
                btnState = true;
              default:
                btnState = false;
            }
            return Wrap(
              alignment: WrapAlignment.center,
              spacing: MainDoubles.wrapSpacing1,
              runSpacing: MainDoubles.wrapSpacing1,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const CustomTooltip(
                    headerText: ReportWidgetStrings.headerText,
                    tooltipText: ReportWidgetStrings.tooltipText),
                Container(
                  decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
                  width: SortWidgetDoubles.mainWidth / 2,
                  child: DDWidget(
                      callback: getIps,
                      items: ReportWidgetList.ddWidgetOptions,
                      selectedColumn: BlocProvider.of<ReportCubit>(context)
                          .state
                          .categoryValue),
                ),
                TextButton(
                    style: FormWidgetStyles.searchBtnStyle,
                    onPressed: () {
                      btnState ? sendToBackend() : null;
                    },
                    child: const Text(MainStrings.reportBtnString)),
              ],
            );
          },
        ));
  }
}
