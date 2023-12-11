import 'package:data_table_2/data_table_2.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_borders.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultTable extends StatelessWidget {
  const SearchResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          List<DataRow> source =
              generateRows(newState: state.currentState, rows: state.datas);
          return DataTable2(
            columns: MainLists.dataTableColumnNames,
            rows: source,
            minWidth: SearchWidgetDoubles.minWidth,
            isHorizontalScrollBarVisible: true,
            decoration: SearchWidgetDecorations.searchTableDecor,
            dataTextStyle: MainStyles.whiteStyle,
            headingRowColor: MaterialStatePropertyAll(MainColors.color4),
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

  snacbarGenerator(context, SearchState state) {
    String result = "";
    Color backgroundColor = Colors.red;
    switch (state.currentState) {
      case SearchingStates.success:
        result = SnackBarStrings.success;
        backgroundColor = MainColors.color1;
      case SearchingStates.loading:
        result = SnackBarStrings.loading;
        backgroundColor = Colors.yellow;
      case SearchingStates.empty:
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
    {required List<dynamic> rows, required SearchingStates newState}) {
  switch (newState) {
    case SearchingStates.success:
      return rows.map((row) {
        return DataRow(cells: [
          DataCell(Text("${row[MainStrings.searchOption1value]}")),
          DataCell(Text("${row[MainStrings.searchOption2value]}")),
          DataCell(Text("${row[MainStrings.searchOption3value]}")),
          DataCell(Text("${row[MainStrings.searchOption4value]}")),
          DataCell(Text("${row[MainStrings.searchOption5value]}")),
          DataCell(Text("${row[MainStrings.searchOption6value]}")),
          DataCell(Text("${row[MainStrings.searchOption7value]}")),
          DataCell(Text("${row[MainStrings.searchOption8value]}")),
          DataCell(Text("${row[MainStrings.searchOption9value]}")),
          DataCell(Text("${row[MainStrings.searchOption10value]}")),
          DataCell(Text("${row[MainStrings.searchOption11value]}")),
        ], color: const MaterialStatePropertyAll(MainColors.color1));
      }).toList();
    case SearchingStates.loading:
      return SearchWidgetList.loadingRows;
    default:
      return SearchWidgetList.emptyRows;
  }
}
