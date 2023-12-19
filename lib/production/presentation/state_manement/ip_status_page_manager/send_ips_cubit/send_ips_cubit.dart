import 'package:bloc/bloc.dart';
import 'package:elk_frontend/production/data/api/elk_api.dart';
part 'send_ips_state.dart';

class SendIpsCubit extends Cubit<SendIpsState> {
  SendIpsCubit() : super(SendIpsState());
  final ElkApiService _elkApiService = ElkApiService();

  sendIps() async {
    if (state.destinationAddress != "" && state.sourceAddress != "") {
      emit(SendIpsState(
              currentState: SendingStates.loading,
              sourceAddress: state.sourceAddress,
              destinationAddress: state.destinationAddress));
      var response = await _elkApiService.sendTheIps(
          saddr: state.sourceAddress, daddr: state.destinationAddress);
      switch (response["result"]) {
        case "success":
          emit(SendIpsState(
              currentState: SendingStates.success,
              sourceAddress: state.sourceAddress,
              destinationAddress: state.destinationAddress));
          break;
        default:
          emit(SendIpsState(
              currentState: SendingStates.failed,
              sourceAddress: state.sourceAddress,
              destinationAddress: state.destinationAddress));
          break;
      }
    } else {
      emit(SendIpsState(
          currentState: SendingStates.empty,
          sourceAddress: state.sourceAddress,
          destinationAddress: state.destinationAddress));
    }
  }

  changeOfSaddrFromForm({required String sourceAddress}) {
    emit(SendIpsState(
      currentState: state.currentState,
      sourceAddress: sourceAddress,
      destinationAddress: state.destinationAddress,
    ));
  }

  changeOfDaddrFromForm({required String destinationAddress}) {
    emit(SendIpsState(
      currentState: state.currentState,
      sourceAddress: state.sourceAddress,
      destinationAddress: destinationAddress,
    ));
  }
}
