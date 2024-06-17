import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// Checks internet connectivity and invokes callbacks based on connection status.
///
/// Checks the current internet connectivity using the Connectivity plugin.
/// Calls [onConnected] callback if internet connectivity is available.
/// Calls [onDisconnected] callback if no internet connectivity is available.
///
/// Throws an error if there is an issue checking connectivity or if the
/// `connectivityResult` does not contain a valid connectivity status.
///
/// Parameters:
/// - [onConnected]: Required callback function invoked when internet connectivity is available.
/// - [onDisconnected]: Required callback function invoked when no internet connectivity is available.
Future<void> InternetConnectivityCheck({
  required VoidCallback onConnected,
  required VoidCallback onDisconnected,
}) async {
  try {
    // Check current connectivity status
    final connectivityResult = await Connectivity().checkConnectivity();

    // Handle based on connectivity status
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // Invoke onDisconnected callback if no internet connectivity
      onDisconnected();
    } else {
      // Invoke onConnected callback if internet connectivity is available
      onConnected();
    }
  } catch (e) {
    // Throw error message if there is an issue checking connectivity
    // or handling the connectivity result
    throw "Error during internet connectivity check: $e";
  }
}

