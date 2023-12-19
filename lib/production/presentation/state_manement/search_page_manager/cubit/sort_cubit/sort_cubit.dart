import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/search_page_manager/cubit/search_cubit/search_cubit.dart';

part 'sort_state.dart';

class SortCubit extends Cubit<SortState> {
  late SearchCubit _searchCubit;
  late StreamSubscription _searchSubscription;
  final ElkApiService _elkApiService = ElkApiService();
  SearchingStates lastState = SearchingStates.initial;

  SortCubit({required SearchCubit searchCubit}) : super(SortState()) {
    _searchCubit = searchCubit;

    _searchSubscription = searchCubit.stream.listen((searchStateValue) {
      switch (searchStateValue.currentState) {
        case SearchingStates.loading:
          emit(SortState(
              currentState: SortStates.loading, sortValue: state.sortValue));
          break;
        case SearchingStates.success:
          if (lastState != searchStateValue.currentState) {
            countTheValues(state.sortValue);
          }
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
            lastState = searchStateValue.currentState;

    });
  }
  countTheValues(String paramForSort) async {
    emit(SortState(
        currentState: SortStates.loading,
        sortValue: paramForSort,
        valuesToShow: state.valuesToShow));
    switch (_searchCubit.state.currentState) {
      case SearchingStates.success:
        List<dynamic> aggregations = [];
        var response = await _elkApiService.getAggregations(
            columnName: _searchCubit.state.columnName,
            value: _searchCubit.state.valueToSearch,
            sort: paramForSort);
        if (response["result"] == "success") {
          aggregations = response["aggregations"];
          emit(SortState(
              currentState: SortStates.success,
              sortValue: state.sortValue,
              valuesToShow: aggregations));
        } else {
          emit(SortState(
            currentState: SortStates.empty,
            sortValue: state.sortValue,
          ));
        }

        break;
      default:
        emit(SortState(
          currentState: SortStates.empty,
          sortValue: state.sortValue,
        ));
        break;
    }
  }

  @override
  Future<void> close() async {
    _searchSubscription.cancel();
    super.close();
  }
}
