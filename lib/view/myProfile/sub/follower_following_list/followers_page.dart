import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/components/widgets/column_with_spacing.dart';
import 'package:social_app/core/components/widgets/custom_loading.dart';
import 'package:social_app/core/constants/app_constants.dart';
import 'package:social_app/core/constants/padding_values.dart';
import 'package:social_app/core/extension/context_extension.dart';
import 'package:social_app/view/myProfile/sub/follower_following_list/controller/follower_following_list_controller.dart';

import '../../../../core/components/text/vasseurr_text_form_field.dart';
import '../../../../core/components/widgets/custom_profile_image.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../messages/model/user.dart';
import 'widgets/remove_follower_button.dart';

class FollowersPage extends GetView<FollowerFollowListController> {
  FollowersPage({Key? key}) : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: false,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: GetX<FollowerFollowListController>(
        initState: (state) async => await controller.getFollowersList(),
        builder: (controller) {
          return controller.isLoadingFollower.value == true
              ? const CustomLoading()
              : _body(context, controller);
        },
      ),
    );
  }

  SingleChildScrollView _body(
      BuildContext context, FollowerFollowListController controller) {
    return SingleChildScrollView(
      child: ColumnWithSpacing(
        space: CustomPaddingValues.mediumV,
        children: [
          VasseurrTFF(
            textEditingController: _textEditingController,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            borderColor: Colors.grey,
            onChanged: (value) => filterSearchResults(value),
            maxLines: 1,
            hintText: LocaleKeys.feature_searchUser.tr(),
          ),
          controller.tempFollowerUserModels.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: context.getHeight * .25),
                  child: Text(
                    LocaleKeys.profile_noFollower.tr(),
                    style: TextStyle(fontSize: 13.sp),
                  ),
                )
              : _userList(controller),
        ],
      ),
    );
  }

  ListView _userList(FollowerFollowListController controller) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            //    onTap: () => navigateProfile(index),
            child: ListTile(
              leading: CustomProfileImage(
                gender: controller.tempFollowerUserModels[index].gender,
              ),
              title: Text(
                controller.tempFollowerUserModels[index].userName,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                controller.tempFollowerUserModels[index].fullName!,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
              trailing: RemoveFollowerButton(index: index),
            ),
          ),
        );
      },
      itemCount: controller.tempFollowerUserModels.length,
      shrinkWrap: true,
    );
  }

  void _onRefresh() async {
    await Future.delayed(
        const Duration(milliseconds: AppConstants.midDuration));
    debugPrint("REFRESHED FOLLOWERS");
    controller.getFollowersList();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(
        const Duration(milliseconds: AppConstants.midDuration));
    controller.getFollowersList();
    debugPrint("REFRESHED");
    _refreshController.loadComplete();
  }

  filterSearchResults(String searchingText) {
    List<UserModel> tempSearchList = [];
    tempSearchList.addAll(controller.followerUserModels);
    if (searchingText.isNotEmpty) {
      List<UserModel> dummyListData = [];
      for (var item in tempSearchList) {
        if (item.userName.toLowerCase().contains(searchingText.toLowerCase()) ||
            item.fullName!
                .toLowerCase()
                .contains(searchingText.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      controller.tempFollowerUserModels.clear();
      controller.tempFollowerUserModels.addAll(dummyListData);
      return;
    } else {
      controller.tempFollowerUserModels.clear();
      controller.tempFollowerUserModels.addAll(controller.followerUserModels);
    }
  }
}
