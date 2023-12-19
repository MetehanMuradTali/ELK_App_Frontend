part of 'send_ips_cubit.dart';

enum SendingStates { initial, loading, success, failed, empty }

class SendIpsState {
  SendingStates currentState;
  String sourceAddress;
  String destinationAddress;


  SendIpsState(
      {this.sourceAddress = "",
      this.currentState = SendingStates.initial,
      this.destinationAddress = ""});
}
