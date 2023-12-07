import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/data_sources/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit.dart';

part 'sort_state.dart';

class SortCubit extends Cubit<SortState> {
  late SearchCubit _searchCubit;
  late StreamSubscription _searchSubscription;
  final ElkApiService _elkApiService = ElkApiService();

  SortCubit({required SearchCubit searchCubit}) : super(SortState()) {
    _searchCubit = searchCubit;

    _searchSubscription = searchCubit.stream.listen((searchStateValue) {
      switch (searchStateValue.currentState) {
        case SearchingStates.loading:
          emit(SortState(
              currentState: SortStates.loading, sortValue: state.sortValue));
          break;
        case SearchingStates.success:
          countTheValues(state.sortValue);
          break;
        case SearchingStates.empty:
          emit(SortState(
              currentState: SortStates.empty, sortValue: state.sortValue));
          break;
        case SearchingStates.failed:
          emit(SortState(
              currentState: SortStates.failed, sortValue: state.sortValue));
          break;
        default:
          emit(SortState(
              currentState: SortStates.initial, sortValue: state.sortValue));
          break;
      }
    });
  }
  countTheValues(String paramForSort)async {
    emit(SortState(
        currentState: state.currentState,
        sortValue: paramForSort,
        valuesToShow: state.valuesToShow)); 
    List<dynamic> aggregations = [];
    if (_searchCubit.state.currentState == SearchingStates.success) {
      var response = await _elkApiService.getAggregations(
          columnName: _searchCubit.state.columnName,
          value: _searchCubit.state.valueToSearch,
          sort: paramForSort);
      aggregations = response["aggregations"];
    }
    emit(SortState(
        currentState: SortStates.success,
        sortValue: state.sortValue,
        valuesToShow: aggregations));
  }

  @override
  Future<void> close() async {
    _searchSubscription.cancel();
    super.close();
  }
}
