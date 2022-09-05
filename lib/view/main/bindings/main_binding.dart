import 'package:get/get.dart';
import 'package:social_app/view/main/controller/main_controller.dart';
import 'package:social_app/view/myProfile/bindings/my_profile_binding.dart';
import 'package:social_app/view/social/bindings/social_binding.dart';

import '../../home/bindings/home_binding.dart';
import '../../messages/bindings/messages_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    }, fenix: true);
    HomeBinding().dependencies();
    SocialBinding().dependencies();
    MyProfileBinding().dependencies();
    MessagesBinding().dependencies();
  }
}
