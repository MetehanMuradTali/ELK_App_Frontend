part of 'latest1hour_cubit.dart';

enum Latest1HourStates { initial, loading, success, failed, empty }

class Latest1HourState {
  Latest1HourStates currentState;
  String categoryValue;
  List<dynamic> valuesToShow;

  Latest1HourState(
      {this.valuesToShow = const [],
      this.currentState = Latest1HourStates.initial,
      this.categoryValue = ReportWidgetStrings.reportOptionDefault});
}
