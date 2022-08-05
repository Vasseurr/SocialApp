import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:social_app/core/init/network/manager/base/network_base_manager.dart';

class NetworkManager extends INetworkManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkManager() : _connectivity = Connectivity();

  @override
  Future<NetworkResult> checkNetworkFirstTime() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  //* Listen network changes
  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      log(event.toString());
      onChange.call(NetworkResult.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
