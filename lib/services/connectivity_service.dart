import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kamran_quiz/models/connectivity_state.dart';

class ConnectivityService {
  Future<ConnectivityState> connectionState() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult[0] == ConnectivityResult.wifi) {
      return ConnectivityState.wifi;
    } else if (connectivityResult[0] == ConnectivityResult.mobile) {
      return ConnectivityState.mobile;
    } else {
      return ConnectivityState.none;
    }
  }
}
