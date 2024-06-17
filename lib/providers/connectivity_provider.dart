import 'package:flutter/material.dart';
import 'package:kamran_quiz/models/connectivity_state.dart';
import 'package:kamran_quiz/repositories/connectivity_repository.dart';

class ConnectivityProvider extends ChangeNotifier {
  final ConnectivityRepository connectivityRepository;

  ConnectivityProvider({required this.connectivityRepository});
  Future<ConnectivityState> connectionState() async {
    return await connectivityRepository.connectionState();
  }
}
