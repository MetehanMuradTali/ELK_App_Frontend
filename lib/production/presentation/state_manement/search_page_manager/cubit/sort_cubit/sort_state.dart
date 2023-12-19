part of 'sort_cubit.dart';

enum SortStates { initial, loading, success, failed, empty }

class SortState {
  SortStates currentState;
  String sortValue;
  List<dynamic> valuesToShow;

  SortState(
      {this.valuesToShow = const [],
      this.currentState = SortStates.initial,
      this.sortValue = MainStrings.searchOption1value});
}
