part of 'search_cubit.dart';

enum SearchingStates {
  initial,
  loading,
  success,
  failed,
  empty,
  conectionError
}

class SearchState {
  SearchingStates currentState;
  List<dynamic> datas;
  String columnName;
  String valueToSearch;
  int totalResultCount;
  SearchState(
      {this.datas = const [],
      this.currentState = SearchingStates.initial,
      this.columnName = "proto",
      this.valueToSearch = "",
      this.totalResultCount = 0});
}
