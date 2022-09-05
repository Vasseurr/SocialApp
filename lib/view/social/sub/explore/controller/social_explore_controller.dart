import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../messages/model/user.dart';

class SocialExploreController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<UserModel> userList = RxList();

  changeLoading() => isLoading.value = !isLoading.value;

  @override
  void onInit() {
    super.onInit();
    userList.addAll(
      [
        UserModel(
            profileImageUrl: AppConstants.avatarMaleURL,
            postsUrlList: [
              [AppConstants.tempUrl1],
              [AppConstants.tempUrl4],
              [AppConstants.tempUrl3, AppConstants.tempUrl2],
              [
                AppConstants.tempUrl5,
                AppConstants.tempUrl2,
                AppConstants.tempUrl3
              ],
              [AppConstants.tempUrl3],
              [
                AppConstants.tempUrl4,
                AppConstants.tempUrl2,
                AppConstants.tempUrl3
              ],
              [AppConstants.tempUrl2, AppConstants.tempUrl3],
              [AppConstants.tempUrl5, AppConstants.tempUrl2],
              [
                AppConstants.tempUrl1,
                AppConstants.tempUrl2,
                AppConstants.tempUrl3
              ],
            ],
            storiesUrlList: [
              [AppConstants.tempUrl3],
              [AppConstants.tempUrl1],
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl4],
              [AppConstants.tempUrl3],
              [AppConstants.tempUrl5],
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl4],
              [AppConstants.tempUrl1],
            ],
            userName: "okanrzgr",
            gender: "male"),
        UserModel(
            profileImageUrl: AppConstants.avatarFemaleURL,
            postsUrlList: [
              [
                AppConstants.tempUrl4,
                AppConstants.tempUrl2,
                AppConstants.tempUrl3
              ],
              [AppConstants.tempUrl2, AppConstants.tempUrl3],
              [AppConstants.tempUrl5, AppConstants.tempUrl2],
            ],
            storiesUrlList: [
              [AppConstants.tempUrl4],
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl1],
            ],
            userName: "edaltsl",
            gender: "female"),
        UserModel(
            profileImageUrl: AppConstants.avatarFemaleURL,
            postsUrlList: [
              [AppConstants.tempUrl5],
              [AppConstants.tempUrl2]
            ],
            storiesUrlList: [
              [AppConstants.tempUrl2],
            ],
            userName: "busracan",
            gender: "female"),
        UserModel(
            profileImageUrl: AppConstants.avatarMaleURL,
            postsUrlList: [
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl3],
              [AppConstants.tempUrl4]
            ],
            storiesUrlList: [
              [AppConstants.tempUrl5],
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl1],
            ],
            userName: "furkanshy",
            gender: "male"),
        UserModel(
            profileImageUrl: AppConstants.avatarFemaleURL,
            postsUrlList: [
              [AppConstants.tempUrl1],
              [AppConstants.tempUrl3]
            ],
            storiesUrlList: [
              [AppConstants.tempUrl4],
              [AppConstants.tempUrl2],
            ],
            userName: "melekkhh",
            gender: "male"),
        UserModel(
            profileImageUrl: AppConstants.avatarMaleURL,
            postsUrlList: [
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl3]
            ],
            storiesUrlList: [
              [AppConstants.tempUrl5],
              [AppConstants.tempUrl2],
            ],
            userName: "kemalKlc",
            gender: "male"),
        UserModel(
            profileImageUrl: AppConstants.avatarFemaleURL,
            postsUrlList: [
              [AppConstants.tempUrl2],
              [AppConstants.tempUrl3]
            ],
            storiesUrlList: [
              [AppConstants.tempUrl1],
              [AppConstants.tempUrl2],
            ],
            userName: "melekmosso",
            gender: "female"),
      ],
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
