import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/latest1hour_cubit/latest1hour_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/dropdown.widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Latest1Hour extends StatefulWidget {
  const Latest1Hour({super.key});

  @override
  State<Latest1Hour> createState() => _Latest1HourState();
}

class _Latest1HourState extends State<Latest1Hour> {
  getIps(String? newValue) {
    BlocProvider.of<Latest1HourCubit>(context).getTheIPAddresses(newValue!);
    setState(() {});
  }

  sendToBackend() {
    BlocProvider.of<Latest1HourCubit>(context).sendToBackend();
  }

  @override
  void initState() {
    getIps(BlocProvider.of<Latest1HourCubit>(context).state.categoryValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: CustomPaddings.mainPadding,
        decoration: CustomBoxDecorations.outsideBoxDecor,
        child: BlocBuilder<Latest1HourCubit, Latest1HourState>(
          builder: (context, state) {
            bool btnState;
            switch (state.currentState) {
              case Latest1HourStates.success:
                btnState = true;
              default:
                btnState = false;
            }
            return Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: MainDoubles.wrapSpacing1,
              runSpacing: MainDoubles.wrapSpacing1,
              children: [
                const CustomTooltip(
                    headerText: Latest1HourWidgetStrings.headerText,
                    tooltipText: Latest1HourWidgetStrings.tooltipText),
                Container(
                  decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
                  width: SortWidgetDoubles.mainWidth / 2,
                  child: DDWidget(
                      callback: getIps,
                      items: ReportWidgetList.ddWidgetOptions,
                      selectedColumn: BlocProvider.of<Latest1HourCubit>(context)
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
