import 'package:data_table_2/data_table_2.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_borders.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/last1hour_cubit/last1hour_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Last1HourTable extends StatelessWidget {
  const Last1HourTable({super.key});
  final String selectedColumn = ReportWidgetStrings.reportOptionDefault;
  @override
  Widget build(BuildContext context) {
    late DataTableSource rows;
    return BlocBuilder<Last1HourCubit, Last1HourState>(
      builder: (context, state) {
        rows = DataTableRows(
            newState: state.currentState, rows: state.valuesToShow);
        return PaginatedDataTable2(
          columns: SortWidgetLists.sortTableColumnNames,
          source: rows,
          showFirstLastButtons: true,
          renderEmptyRowsInTheEnd: false,
          minWidth: SortWidgetDoubles.mainWidth,
          dividerThickness: MainDoubles.tableDividerTickness,
          dataTextStyle: MainStyles.whiteStyle,
          headingTextStyle: MainStyles.whiteHeaderStyle,
          headingRowColor: const MaterialStatePropertyAll(MainColors.color4),
          border: MainBorders.customTableBorder,
        );
      },
    );
  }
}

class DataTableRows extends DataTableSource {
  final bool _isRowCountApproximate = false;
  int selectedRowCountValue = 0;
  List<dynamic> rows;
  final Last1HourStates newState;

  DataTableRows({required this.rows, required this.newState});
  @override
  DataRow? getRow(int index) {
    switch (newState) {
      case Last1HourStates.success:
        return DataRow(cells: [
          DataCell(Text("${rows[index]["key"]}")),
          DataCell(Text("${rows[index]["doc_count"]}"))
        ], color: const MaterialStatePropertyAll(MainColors.color1));
      case Last1HourStates.loading:
        return SortWidgetLists.loadingRow;
      default:
        return SortWidgetLists.emptyRow;
    }
  }

  @override
  bool get isRowCountApproximate => _isRowCountApproximate;

  @override
  int get rowCount => newState == Last1HourStates.success ? rows.length : 10;

  @override
  int get selectedRowCount => selectedRowCountValue;
}
