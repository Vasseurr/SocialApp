import 'package:get/get.dart';

import '../../../../messages/model/user.dart';

class FollowerFollowListController extends GetxController {
  RxBool isLoadingFollower = false.obs;
  RxBool isLoadingFollowing = false.obs;

  RxList<UserModel> followerUserModels = RxList();
  RxList<UserModel> tempFollowerUserModels = RxList();
  RxList<UserModel> followingUserModels = RxList();
  RxList<UserModel> tempFollowingUserModels = RxList();

  changeFollowerLoading(bool value) => isLoadingFollower.value = value;
  changeFollowingLoading(bool value) => isLoadingFollowing.value = value;

  @override
  void onInit() {
    super.onInit();
    followerUserModels.addAll([
      UserModel(userName: "Alexandra", gender: 'female'),
      UserModel(userName: "Alice", gender: 'female'),
      UserModel(userName: "Grace", gender: 'female'),
      UserModel(userName: "John", gender: 'male'),
      UserModel(userName: "Alfie", gender: 'male'),
      UserModel(userName: "Audrey", gender: 'female'),
      UserModel(userName: "Freya", gender: 'female'),
      UserModel(userName: "Florence", gender: 'female'),
    ]);
    followingUserModels.addAll([
      UserModel(userName: "Harriet", gender: 'female'),
      UserModel(userName: "Rafe", gender: 'male'),
      UserModel(userName: "Raleigh", gender: 'male'),
      UserModel(userName: "Isabelle", gender: 'female'),
      UserModel(userName: "Helena", gender: 'female'),
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getFollowersList() async {
    try {
      changeFollowerLoading(true);
      tempFollowerUserModels.value = followerUserModels.toList();
    } catch (e) {
      changeFollowerLoading(false);
    }
    changeFollowerLoading(false);
  }

  Future<void> getFollowingList() async {
    try {
      changeFollowingLoading(true);
      tempFollowingUserModels.value = followingUserModels.toList();
    } catch (e) {
      changeFollowingLoading(false);
    }
    changeFollowingLoading(false);
  }

  void removeFromFollower(int index) {
    followerUserModels.removeAt(index);
    tempFollowerUserModels.value = followerUserModels.toList();
    Get.close(1);
  }

  void removeFromFollowing(int index) {
    followingUserModels.removeAt(index);
    tempFollowingUserModels.value = followingUserModels.toList();
    Get.close(1);
  }
}
