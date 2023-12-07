part of 'report_cubit.dart';

enum ReportStates { initial, loading, success, failed, empty }

class ReportState {
  ReportStates currentState;
  String categoryValue;
  List<dynamic> valuesToShow;

  ReportState(
      {this.valuesToShow = const [],
      this.currentState = ReportStates.initial,
      this.categoryValue = ReportWidgetStrings.reportOptionDefault});
}
