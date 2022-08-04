import 'package:get/get.dart';
import 'package:social_app/view/main/controller/main_controller.dart';

import '../../home/bindings/home_binding.dart';
import '../../messages/bindings/messages_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    }, fenix: true);
    HomeBinding().dependencies();
    MessagesBinding().dependencies();
  }
}
