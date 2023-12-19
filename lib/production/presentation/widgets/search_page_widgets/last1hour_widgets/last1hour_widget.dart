import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/state_manement/search_page_manager/cubit/last1hour_cubit/last1hour_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/dropdown.widget.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Last1Hour extends StatefulWidget {
  const Last1Hour({super.key});

  @override
  State<Last1Hour> createState() => _Last1HourState();
}

class _Last1HourState extends State<Last1Hour> {
  getIps(String? newValue) {
    BlocProvider.of<Last1HourCubit>(context).getTheIPAddresses(newValue!);
    setState(() {});
  }

  sendToBackend() {
    BlocProvider.of<Last1HourCubit>(context).sendToBackend();
  }

  @override
  void initState() {
    getIps(BlocProvider.of<Last1HourCubit>(context).state.categoryValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: CustomPaddings.mainPadding,
        decoration: CustomBoxDecorations.outsideBoxDecor,
        child: BlocBuilder<Last1HourCubit, Last1HourState>(
          builder: (context, state) {
            bool btnState;
            switch (state.currentState) {
              case Last1HourStates.success:
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
                    headerText: Last1HourWidgetStrings.headerText,
                    tooltipText: Last1HourWidgetStrings.tooltipText),
                Container(
                  decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
                  width: SortWidgetDoubles.mainWidth / 2,
                  child: DDWidget(
                      callback: getIps,
                      items: ReportWidgetList.ddWidgetOptions,
                      selectedColumn: BlocProvider.of<Last1HourCubit>(context)
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
