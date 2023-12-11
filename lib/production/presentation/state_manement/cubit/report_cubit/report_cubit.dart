import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit/search_cubit.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  late SearchCubit _searchCubit;
  late StreamSubscription _searchSubscription;
  final ElkApiService _elkApiService = ElkApiService();

  ReportCubit({required SearchCubit searchCubit}) : super(ReportState()) {
    _searchCubit = searchCubit;
    SearchingStates lastState = SearchingStates.initial;
    _searchSubscription = searchCubit.stream.listen((searchStateValue) {
      switch (searchStateValue.currentState) {
        case SearchingStates.loading:
          emit(ReportState(
              currentState: ReportStates.loading,
              categoryValue: state.categoryValue));
          break;
        case SearchingStates.success:
          if (lastState != searchStateValue.currentState) {
            getTheIPAddresses(state.categoryValue);
          }

          break;
        case SearchingStates.empty:
          emit(ReportState(
              currentState: ReportStates.empty,
              categoryValue: state.categoryValue));
          break;
        case SearchingStates.failed:
          emit(ReportState(
              currentState: ReportStates.failed,
              categoryValue: state.categoryValue));
          break;
        default:
          emit(ReportState(
              currentState: ReportStates.initial,
              categoryValue: state.categoryValue));
          break;
      }
      lastState = searchStateValue.currentState;
    });
  }
  getTheIPAddresses(String paramForCategory) async {
    emit(ReportState(
        currentState: ReportStates.loading,
        categoryValue: paramForCategory,
        valuesToShow: state.valuesToShow));
    switch (_searchCubit.state.currentState) {
      case SearchingStates.success:
        List<dynamic> aggregations = [];
        var response = await _elkApiService.getReportAggregations(
            columnName: _searchCubit.state.columnName,
            colValue: _searchCubit.state.valueToSearch,
            categoryType: paramForCategory);
        if (response["result"] == "success") {
          aggregations = response["aggregations"];
          emit(ReportState(
              currentState: ReportStates.success,
              categoryValue: state.categoryValue,
              valuesToShow: aggregations));
        } else {
          emit(ReportState(
            currentState: ReportStates.empty,
            categoryValue: state.categoryValue,
          ));
        }
        break;
      default:
        emit(ReportState(
          currentState: ReportStates.empty,
          categoryValue: state.categoryValue,
        ));
        break;
    }
  }

  sendToBackend() async {
    //var response =
        //await _elkApiService.sendTheReport(aggregationList: state.valuesToShow);
  }

  @override
  Future<void> close() async {
    _searchSubscription.cancel();
    super.close();
  }
}
