import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';

part 'latest1hour_state.dart';

class Latest1HourCubit extends Cubit<Latest1HourState> {
  final ElkApiService _elkApiService = ElkApiService();

  Latest1HourCubit() : super(Latest1HourState());

  getTheIPAddresses(String paramForCategory) async {
    emit(Latest1HourState(
        currentState: Latest1HourStates.loading,
        categoryValue: paramForCategory,
        valuesToShow: state.valuesToShow));
    List<dynamic> aggregations = [];
    var response =
        await _elkApiService.searchLatest1Hour(categoryType: paramForCategory);
    if (!isClosed) {
      if (response["result"] == "success") {
        aggregations = response["aggregations"];

        emit(Latest1HourState(
            currentState: Latest1HourStates.success,
            categoryValue: state.categoryValue,
            valuesToShow: aggregations));
      } else {
        emit(Latest1HourState(
          currentState: Latest1HourStates.empty,
          categoryValue: state.categoryValue,
        ));
      }
    }
  }

  sendToBackend() async {
    var response =
        await _elkApiService.sendTheReport(aggregationList: state.valuesToShow);
    print(response);
  }
}
