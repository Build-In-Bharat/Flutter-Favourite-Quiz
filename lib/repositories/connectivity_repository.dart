import 'package:kamran_quiz/models/connectivity_state.dart';
import 'package:kamran_quiz/services/connectivity_service.dart';

class ConnectivityRepository {
  final ConnectivityService connectivityService;

  ConnectivityRepository({required this.connectivityService});

  Future<ConnectivityState> connectionState() async {
    return await connectivityService.connectionState();
  }
}
