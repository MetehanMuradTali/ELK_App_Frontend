import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/data_sources/elk_api.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());
  final ElkApiService _elkApiService = ElkApiService();

  search({int pageNumber = 1}) async {
    emit(SearchState(
        datas: state.datas,
        currentState: SearchingStates.loading,
        columnName: state.columnName,
        valueToSearch: state.valueToSearch,
        totalResultCount: state.totalResultCount));
    Map<String, dynamic> response = await _elkApiService.searchColumn(
        columnName: state.columnName,
        value: state.valueToSearch,
        pageNumber: pageNumber);
    switch (response["result"]) {
      case "success":
        var countResponse = await _elkApiService.getCountOfResults(
            columnName: state.columnName, value: state.valueToSearch);
        int count = countResponse["count"];
        emit(SearchState(
            datas: response["data"],
            currentState: SearchingStates.success,
            columnName: state.columnName,
            valueToSearch: state.valueToSearch,
            totalResultCount: count,));
        break;
      case "failed":
        emit(SearchState(
            datas: [],
            currentState: SearchingStates.failed,
            columnName: state.columnName,
            valueToSearch: state.valueToSearch));
        break;
      case "empty":
        print(response["aggregations"]);
        emit(SearchState(
            datas: [],
            currentState: SearchingStates.empty,
            columnName: state.columnName,
            valueToSearch: state.valueToSearch));
        break;
      case "connection_error":
        emit(SearchState(
            datas: [],
            currentState: SearchingStates.conectionError,
            columnName: state.columnName,
            valueToSearch: state.valueToSearch));
        break;
    }
  }

  changeOfColumnFromForm({required String columnName}) {
    emit(SearchState(
        columnName: columnName,
        currentState: state.currentState,
        datas: state.datas,
        valueToSearch: state.valueToSearch,
        totalResultCount: state.totalResultCount));
  }

  changeOfValueFromForm({required String value}) {
    emit(SearchState(
        columnName: state.columnName,
        currentState: state.currentState,
        datas: state.datas,
        valueToSearch: value,
        totalResultCount: state.totalResultCount));
  }
}
