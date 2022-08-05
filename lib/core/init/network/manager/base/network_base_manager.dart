import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkResult {
  on,
  off;

  //* Enum function
  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkManager {
  Future<NetworkResult> checkNetworkFirstTime();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}
