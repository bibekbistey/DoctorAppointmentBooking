import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisconnected }

final connectivityStatusProvider =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatus>(
  (ref) => ConnectivityStatusNotifier(),
);

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  late ConnectivityStatus lastResult;
  late ConnectivityStatus newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    lastResult = state;
    newState = state;

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        newState = ConnectivityStatus.isConnected;
      } else {
        // Simulate Wi-Fi turned off
        if (lastResult == ConnectivityStatus.isConnected) {
          newState = ConnectivityStatus.isDisconnected;
        } else {
          newState = ConnectivityStatus.isConnected;
        }
      }
      if (newState != lastResult) {
        state = newState;
        lastResult = newState;
      }
    });
  }
}

Future<bool> checkConnectivity() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    return true; // wifi connection available, internet is present
  } else {
    return false;
  }
}