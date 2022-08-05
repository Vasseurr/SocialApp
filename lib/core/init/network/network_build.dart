import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/core/init/network/manager/base/network_base_manager.dart';
import 'package:social_app/core/init/network/manager/network_manager.dart';
import 'package:social_app/core/init/network/no_network_page.dart';
import 'package:social_app/view/main/controller/main_controller.dart';

// ignore: must_be_immutable
class NetworkBuild extends StatefulWidget {
  NetworkBuild({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  State<NetworkBuild> createState() => _NetworkBuildState();
}

class _NetworkBuildState extends State<NetworkBuild> with StateMixin {
  late final INetworkManager _networkManager;
  final MainController _controller = Get.find<MainController>();

  @override
  void initState() {
    super.initState();
    _networkManager = NetworkManager();
    waitForScreen(() {
      _networkManager.handleNetworkChange((result) {
        log(result.toString());
        _controller.networkResult.value = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.networkResult.value == NetworkResult.on
          ? widget.child
          : const NoNetworkPage(),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    //* Call function when the page drawing is finished
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
