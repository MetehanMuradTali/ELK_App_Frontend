part of 'search_cubit.dart';

enum StatusSearchingStates {
  initial,
  loading,
  success,
  failed,
  empty,
  connectionError
}

class StatusSearchState {
  StatusSearchingStates currentState;
  List<dynamic> datas;
  String sourceAdress;
  String destinationAdress;
  String status;
  int totalResultCount;
  StatusSearchState(
      {this.datas = const [],
      this.currentState = StatusSearchingStates.initial,
      this.sourceAdress = "",
      this.destinationAdress = "",
      this.status = "",
      this.totalResultCount = 0});
}
