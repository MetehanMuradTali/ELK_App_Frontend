import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:flutter/material.dart';

class MainLists {
  static const List<DataColumn> dataTableColumnNames = [
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption2, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption3, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption4, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption5, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption6, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption7, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption8, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption9, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption10, softWrap: true))),
    DataColumn(
        label: Center(child: Text(MainStrings.searchOption11, softWrap: true))),
         DataColumn(
        label: Center(child: Text(MainStrings.searchOption12, softWrap: true))),
  ];
  static const List<DropdownMenuItem<dynamic>> ddWidgetOptions = [
    DropdownMenuItem(
        value: MainStrings.searchOption1value,
        child: Text(MainStrings.searchOption1)),
    DropdownMenuItem(
        value: MainStrings.searchOption2value,
        child: Text(MainStrings.searchOption2)),
    DropdownMenuItem(
        value: MainStrings.searchOption3value,
        child: Text(MainStrings.searchOption3)),
    DropdownMenuItem(
        value: MainStrings.searchOption4value,
        child: Text(MainStrings.searchOption4)),
    DropdownMenuItem(
        value: MainStrings.searchOption5value,
        child: Text(MainStrings.searchOption5)),
    DropdownMenuItem(
        value: MainStrings.searchOption6value,
        child: Text(MainStrings.searchOption6)),
    DropdownMenuItem(
        value: MainStrings.searchOption7value,
        child: Text(MainStrings.searchOption7)),
    DropdownMenuItem(
        value: MainStrings.searchOption8value,
        child: Text(MainStrings.searchOption8)),
    DropdownMenuItem(
        value: MainStrings.searchOption9value,
        child: Text(MainStrings.searchOption9)),
    DropdownMenuItem(
        value: MainStrings.searchOption10value,
        child: Text(MainStrings.searchOption10)),
    DropdownMenuItem(
        value: MainStrings.searchOption11value,
        child: Text(MainStrings.searchOption11)),
    DropdownMenuItem(
        value: MainStrings.searchOption12value,
        child: Text(MainStrings.searchOption12)),
  ];
}

class SearchWidgetList {
  static List<DataRow> emptyRows = List<DataRow>.generate(
      10,
      (index) => const DataRow(cells: [
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
          ], color: MaterialStatePropertyAll(MainColors.color1)));
  static List<DataRow> loadingRows = List<DataRow>.generate(
      10,
      (index) => const DataRow(cells: [
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
          ], color: MaterialStatePropertyAll(MainColors.color1)));
}

class SortWidgetLists {
  static const List<DataColumn> sortTableColumnNames = [
    DataColumn(label: Center(child: Text(SortWidgetStrings.columnName4))),
    DataColumn(label: Center(child: Text(SortWidgetStrings.columnName3)))
  ];
  static const List<DataColumn> sortTableColumnNames2 = [
    DataColumn(label: Center(child: Text(SortWidgetStrings.columnName1))),
    DataColumn(label: Center(child: Text(SortWidgetStrings.columnName2))),
    DataColumn(label: Center(child: Text(SortWidgetStrings.columnName3))),
  ];

  static const DataRow loadingRow = DataRow(
    cells: [
      DataCell(LinearProgressIndicator()),
      DataCell(LinearProgressIndicator())
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );

  static const DataRow loadingRow2 = DataRow(
    cells: [
      DataCell(LinearProgressIndicator()),
      DataCell(LinearProgressIndicator()),
      DataCell(LinearProgressIndicator()),
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );
  static const DataRow emptyRow = DataRow(
    cells: [
      DataCell(Text("")),
      DataCell(Text("")),
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );
  static const DataRow emptyRow2 = DataRow(
    cells: [
      DataCell(Text("")),
      DataCell(Text("")),
      DataCell(Text("")),
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );
  
}
class ReportWidgetList{
  static const List<DropdownMenuItem<dynamic>> ddWidgetOptions = [
      DropdownMenuItem(
          value: ReportWidgetStrings.ddOption1value,
          child: Text(ReportWidgetStrings.ddOption1value)),
      DropdownMenuItem(
          value: ReportWidgetStrings.ddOption2value,
          child: Text(ReportWidgetStrings.ddOption2value)),
      DropdownMenuItem(
          value: ReportWidgetStrings.ddOption3value,
          child: Text(ReportWidgetStrings.ddOption3value)),
      DropdownMenuItem(
          value: ReportWidgetStrings.ddOption4value,
          child: Text(ReportWidgetStrings.ddOption4value)),
      DropdownMenuItem(
          value: ReportWidgetStrings.ddOption5value,
          child: Text(ReportWidgetStrings.ddOption5value)),
    ];
}

class IpStatusWidgetLists{
  static const List<DataColumn> tableColumnNames = [
    DataColumn(label: Center(child: Text(IpStatusWidgetStrings.columnName1))),
    DataColumn(label: Center(child: Text(IpStatusWidgetStrings.columnName2))),
    DataColumn(label: Center(child: Text(IpStatusWidgetStrings.columnName3))),
  ];
  static const DataRow loadingRow = DataRow(
    cells: [
      DataCell(LinearProgressIndicator()),
      DataCell(LinearProgressIndicator()),
      DataCell(Text("Waiting Response")),
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );
  static const DataRow emptyRow = DataRow(
    cells: [
      DataCell(Text("")),
      DataCell(Text("")),
      DataCell(Text("")),
    ],
    color: MaterialStatePropertyAll(MainColors.color1),
  );
}


class StatusPageLists{
  static const List<DropdownMenuItem<dynamic>> ddWidgetOptions = [
    DropdownMenuItem(
        value: StatusStrings.searchDDOption1value,
        child: Text(StatusStrings.searchDDOption1)),
    DropdownMenuItem(
        value: StatusStrings.searchDDOption2value,
        child: Text(StatusStrings.searchDDOption2)),
    DropdownMenuItem(
        value: StatusStrings.searchDDOption3value,
        child: Text(StatusStrings.searchDDOption3)),
    DropdownMenuItem(
        value: StatusStrings.searchDDOption4value,
        child: Text(StatusStrings.searchDDOption4)),
    
  ];
  static const List<DataColumn> dataTableColumnNames = [
    DataColumn(
        label: Center(child: Text(StatusStrings.searchTableColumn1, softWrap: true))),
    DataColumn(
        label: Center(child: Text(StatusStrings.searchTableColumn2, softWrap: true))),
    DataColumn(
        label: Center(child: Text(StatusStrings.searchTableColumn3, softWrap: true))),
  ];

   static List<DataRow> emptyRows = List<DataRow>.generate(
      10,
      (index) => const DataRow(cells: [
            DataCell(Text("")),
            DataCell(Text("")),
            DataCell(Text("")),
          ], color: MaterialStatePropertyAll(MainColors.color1)));
  static List<DataRow> loadingRows = List<DataRow>.generate(
      10,
      (index) => const DataRow(cells: [
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
            DataCell(LinearProgressIndicator()),
          ], color: MaterialStatePropertyAll(MainColors.color1)));
}