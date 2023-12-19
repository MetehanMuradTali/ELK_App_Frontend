part of 'last1hour_cubit.dart';

enum Last1HourStates { initial, loading, success, failed, empty }

class Last1HourState {
  Last1HourStates currentState;
  String categoryValue;
  List<dynamic> valuesToShow;

  Last1HourState(
      {this.valuesToShow = const [],
      this.currentState = Last1HourStates.initial,
      this.categoryValue = ReportWidgetStrings.reportOptionDefault});
}
