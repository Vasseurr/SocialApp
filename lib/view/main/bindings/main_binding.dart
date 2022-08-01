import 'package:get/get.dart';
import 'package:social_app/view/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    }, fenix: true);
  }
}
