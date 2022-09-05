import 'package:get/get.dart';
import 'package:social_app/view/social/repository/social_repository.dart';

import '../../../core/constants/app_constants.dart';
import '../../messages/model/user.dart';

class SocialController extends GetxController {
  final SocialRepository _socialRepository;

  SocialController(this._socialRepository);

  final RxBool isLoading = false.obs;

  final RxList<UserModel> userList = RxList();
  final RxList<List<String>> postList = RxList();

  changeLoading() => isLoading.value = !isLoading.value;

  @override
  void onInit() {
    super.onInit();
    postList.addAll(
      [
        [AppConstants.tempUrl1],
        [AppConstants.tempUrl4],
        [AppConstants.tempUrl3, AppConstants.tempUrl2],
        [AppConstants.tempUrl5, AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl3],
        [AppConstants.tempUrl4, AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl5, AppConstants.tempUrl2],
        [AppConstants.tempUrl1, AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl4, AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl2, AppConstants.tempUrl3],
        [AppConstants.tempUrl5, AppConstants.tempUrl2],
        [AppConstants.tempUrl5],
        [AppConstants.tempUrl2, AppConstants.tempUrl4],
        [AppConstants.tempUrl3],
      ],
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
