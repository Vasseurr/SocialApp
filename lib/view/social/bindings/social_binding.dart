import 'package:get/get.dart';
import 'package:social_app/view/social/controller/social_controller.dart';
import 'package:social_app/view/social/repository/social_repository.dart';
import 'package:social_app/view/social/service/social_service.dart';

class SocialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialController>(
        () => SocialController(SocialRepository(SocialService())));
  }
}
