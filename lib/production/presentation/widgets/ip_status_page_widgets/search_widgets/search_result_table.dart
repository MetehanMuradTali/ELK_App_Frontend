import 'package:data_table_2/data_table_2.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_borders.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/ip_status_page_manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusSearchResultTable extends StatelessWidget {
  const StatusSearchResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatusSearchCubit, StatusSearchState>(
        builder: (context, state) {
          List<DataRow> source =
              generateRows(newState: state.currentState, rows: state.datas);
          return DataTable2(
            columns: StatusPageLists.dataTableColumnNames,
            rows: source,
            minWidth: SearchWidgetDoubles.minWidth,
            isHorizontalScrollBarVisible: true,
            decoration: SearchWidgetDecorations.searchTableDecor,
            dataTextStyle: MainStyles.whiteStyle,
            headingRowColor: const MaterialStatePropertyAll(MainColors.color4),
            headingTextStyle: MainStyles.whiteHeaderStyle,
            border: MainBorders.customTableBorder,
            dividerThickness: MainDoubles.tableDividerTickness,
          );
        },
        listenWhen: (previous, current) {
          if (previous.currentState == current.currentState) {
            return false;
          } else {
            return true;
          }
        },
        listener: snacbarGenerator);
  }

  snacbarGenerator(context, StatusSearchState state) {
    String result = "";
    Color backgroundColor = Colors.red;
    switch (state.currentState) {
      case StatusSearchingStates.success:
        result = SnackBarStrings.success;
        backgroundColor = MainColors.color1;
      case StatusSearchingStates.loading:
        result = SnackBarStrings.loading;
        backgroundColor = Colors.yellow;
      case StatusSearchingStates.empty:
        result = SnackBarStrings.empty;
        backgroundColor = Colors.red;
      default:
        result = SnackBarStrings.failed;
        backgroundColor = Colors.red;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(result)),
      backgroundColor: backgroundColor,
    ));
  }
}

List<DataRow> generateRows(
    {required List<dynamic> rows, required StatusSearchingStates newState}) {
  switch (newState) {
    case StatusSearchingStates.success:
      return rows.map((row) {
        return DataRow(cells: [
          DataCell(Text("${row[StatusStrings.searchTableColumn1value]}")),
          DataCell(Text("${row[StatusStrings.searchTableColumn2value]}")),
          DataCell(Text("${row[StatusStrings.searchTableColumn3value]}")),
        ], color: const MaterialStatePropertyAll(MainColors.color1));
      }).toList();
    case StatusSearchingStates.loading:
      return StatusPageLists.loadingRows;
    default:
      return StatusPageLists.emptyRows;
  }
}
