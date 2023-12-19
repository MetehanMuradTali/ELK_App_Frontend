import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';

part 'search_state.dart';

class StatusSearchCubit extends Cubit<StatusSearchState> {
  StatusSearchCubit() : super(StatusSearchState());
  final ElkApiService _elkApiService = ElkApiService();

  search({int pageNumber = 1}) async {
    emit(StatusSearchState(
        currentState: StatusSearchingStates.loading,
        datas: state.datas,
        sourceAdress: state.sourceAdress,
        destinationAdress: state.destinationAdress,
        status: state.status,
        totalResultCount: state.totalResultCount));
    Map<String, dynamic> response = await _elkApiService.getStatus(
        destinationAdress:state.destinationAdress ,
        sourceAdress: state.sourceAdress,
        status: state.status,
        pageNumber: pageNumber);
    switch (response["result"]) {
      case "success":
        var countResponse = await _elkApiService.getCountOfStatusResults(
            destinationAdress: state.destinationAdress,
            sourceAdress: state.sourceAdress,
            status: state.status);
        int count = countResponse["count"];
        emit(StatusSearchState(
            datas: response["data"],
            currentState: StatusSearchingStates.success,
            destinationAdress: state.destinationAdress,
            sourceAdress: state.sourceAdress,
            status: state.status,
            totalResultCount: count));
        break;
      case "failed":
        emit(StatusSearchState(
            datas: [],
            currentState: StatusSearchingStates.failed,
            destinationAdress: state.destinationAdress,
            sourceAdress: state.sourceAdress,
            status: state.status,
            ));
        break;
      case "empty":
        emit(StatusSearchState(
            datas: [],
            currentState: StatusSearchingStates.empty,
            destinationAdress: state.destinationAdress,
            sourceAdress: state.sourceAdress,
            status: state.status));
        break;
      case "connection_error":
        emit(StatusSearchState(
            datas: [],
            currentState: StatusSearchingStates.connectionError,
            destinationAdress: state.destinationAdress,
            sourceAdress: state.sourceAdress,
            status: state.status));
        break;
    }
  }

  changeOfSaddrFromForm({required String sourceAdress}) {
    emit(StatusSearchState(
        currentState: state.currentState,
        sourceAdress: sourceAdress,
        destinationAdress: state.destinationAdress,
        status: state.status,
        datas: state.datas,
        totalResultCount: state.totalResultCount));
  }

  changeOfDaddrFromForm({required String destinationAdress}) {
    emit(StatusSearchState(
        currentState: state.currentState,
        sourceAdress: state.sourceAdress,
        destinationAdress: destinationAdress,
        status: state.status,
        datas: state.datas,
        totalResultCount: state.totalResultCount));
  }
  changeOfStatusFromForm({required String status}) {
    emit(StatusSearchState(
        currentState: state.currentState,
        sourceAdress: state.sourceAdress,
        destinationAdress: state.destinationAdress,
        status: status,
        datas: state.datas,
        totalResultCount: state.totalResultCount));
  }
}
