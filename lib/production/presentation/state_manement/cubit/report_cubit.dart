import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/data_sources/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit.dart';

part 'report_state.dart';


class ReportCubit extends Cubit<ReportState> {
  late SearchCubit _searchCubit;
  late StreamSubscription _searchSubscription;
  final ElkApiService _elkApiService = ElkApiService();

  ReportCubit({required SearchCubit searchCubit}) : super(ReportState()) {
    _searchCubit = searchCubit;

    _searchSubscription = searchCubit.stream.listen((searchStateValue) {
      switch (searchStateValue.currentState) {
        case SearchingStates.loading:
          emit(ReportState(
              currentState: ReportStates.loading, categoryValue: state.categoryValue));
          break;
        case SearchingStates.success:
          getTheIPAddresses(state.categoryValue);
          break;
        case SearchingStates.empty:
          emit(ReportState(
              currentState: ReportStates.empty, categoryValue: state.categoryValue));
          break;
        case SearchingStates.failed:
          emit(ReportState(
              currentState: ReportStates.failed, categoryValue: state.categoryValue));
          break;
        default:
          emit(ReportState(
              currentState: ReportStates.initial, categoryValue: state.categoryValue));
          break;
      }
    });
  }
  getTheIPAddresses(String paramForCategory)async {
    emit(ReportState(
        currentState: state.currentState,
        categoryValue: paramForCategory,
        valuesToShow: state.valuesToShow)); 
    List<dynamic> aggregations = [];
    if (_searchCubit.state.currentState == SearchingStates.success) {
      var response = await _elkApiService.reportAggregations(
          columnName: _searchCubit.state.columnName,
          colValue: _searchCubit.state.valueToSearch,
          categoryType: paramForCategory);
      aggregations = response["aggregations"];
    }
    emit(ReportState(
        currentState: ReportStates.success,
        categoryValue: state.categoryValue,
        valuesToShow: aggregations));
  }

  @override
  Future<void> close() async {
    _searchSubscription.cancel();
    super.close();
  }
}
