import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';

part 'last1hour_state.dart';

class Last1HourCubit extends Cubit<Last1HourState> {
  final ElkApiService _elkApiService = ElkApiService();

  Last1HourCubit() : super(Last1HourState());

  getTheIPAddresses(String paramForCategory) async {
    emit(Last1HourState(
        currentState: Last1HourStates.loading,
        categoryValue: paramForCategory,
        valuesToShow: state.valuesToShow));
    List<dynamic> aggregations = [];
    var response =
        await _elkApiService.searchLast1Hour(categoryType: paramForCategory);
    if (!isClosed) {
      if (response["result"] == "success") {
        aggregations = response["aggregations"];

        emit(Last1HourState(
            currentState: Last1HourStates.success,
            categoryValue: state.categoryValue,
            valuesToShow: aggregations));
      } else {
        emit(Last1HourState(
          currentState: Last1HourStates.empty,
          categoryValue: state.categoryValue,
        ));
      }
    }
  }

  sendToBackend() async {
    await _elkApiService.sendTheReport(aggregationList: state.valuesToShow);
  }
}
