import 'package:get/get.dart';
import 'package:social_app/view/myProfile/controller/my_profile_controller.dart';
import 'package:social_app/view/myProfile/repository/my_profile_repository.dart';
import 'package:social_app/view/myProfile/service/my_profile_service.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProfileController>(
        () => MyProfileController(MyProfileRepository(MyProfileService())));
  }
}
