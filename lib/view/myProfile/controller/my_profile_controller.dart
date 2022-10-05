import 'package:get/get.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/view/myProfile/model/user_profile_model.dart';
import 'package:social_app/view/myProfile/repository/my_profile_repository.dart';

class MyProfileController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<List<String>> postImages = RxList();
  final RxList<String> storiesImage = RxList();
  final Rx<UserProfileModel> userProfile = UserProfileModel(
          postNumber: "300", followerNumber: "14K", followingNumber: "1,435")
      .obs;

  final MyProfileRepository _myProfileRepository;
  MyProfileController(this._myProfileRepository);

  changeLoading(bool value) => isLoading.value = value;

  @override
  void onInit() {
    super.onInit();
    postImages.addAll([
      [AppConstants.tempUrl1],
      [AppConstants.tempUrl4],
      [AppConstants.tempUrl3, AppConstants.tempUrl2],
      [AppConstants.tempUrl5, AppConstants.tempUrl2, AppConstants.tempUrl3],
      [AppConstants.tempUrl3],
      [AppConstants.tempUrl4, AppConstants.tempUrl2, AppConstants.tempUrl3],
      [AppConstants.tempUrl2, AppConstants.tempUrl3],
      [AppConstants.tempUrl5, AppConstants.tempUrl2],
      [AppConstants.tempUrl1, AppConstants.tempUrl2, AppConstants.tempUrl3],
    ]);
    storiesImage.addAll([
      AppConstants.tempUrl2,
      AppConstants.tempUrl3,
      AppConstants.tempUrl1,
      AppConstants.tempUrl4,
      AppConstants.tempUrl3,
      AppConstants.tempUrl5,
      AppConstants.tempUrl2,
      AppConstants.tempUrl4,
      AppConstants.tempUrl1,
    ]);
  }

  @override
  void onReady() {
    super.onReady();
    changeLoading(false);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
